# frozen_string_literal: true

# Copyright 2023 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

flag :all_files, "--all" do |f|
  f.desc "Check all event files instead of looking for changes"
end
flag :github_event_name, "--github-event-name=EVENT" do |f|
  f.default ""
  f.desc "Name of the github event triggering this job. Optional."
end
flag :github_event_payload, "--github-event-payload=PATH" do |f|
  f.default ""
  f.desc "Path to the github event payload JSON file. Optional."
end
flag :head_commit, "--head=COMMIT" do |f|
  f.desc "Ref or SHA of the head commit when analyzing changes. Defaults to the current commit."
end
flag :base_commit, "--base=COMMIT" do |f|
  f.desc "Ref or SHA of the base commit when analyzing changes. If omitted, uses uncommitted diffs."
end
flag :pr_number, "--pr-number=NUMBER" do |f|
  f.desc "Number of the pull request to update"
end

require "json"

include :git_cache
include :exec
include :terminal

EXCLUDE_MODULES = [
  /^::Google::Cloud::Audit::/,
  /^::Google::Cloud::CloudBuild::/,
  /^::Google::Cloud::Storage::/,
  /^::Google::Firebase::/,
]

def run
  Dir.chdir context_directory
  gcr_dir = git_cache.get "https://github.com/googleapis/google-cloud-ruby.git", update: true
  files = find_files
  modules = find_modules files
  issues = check_modules modules, gcr_dir
  output issues
end

def find_files
  return Dir.glob "**/*_pb.rb" if all_files
  logger.info "Evaluating changes..."
  base_ref, head_ref = interpret_github_event
  ensure_checkout head_ref unless head_ref.nil?
  files = find_changed_files base_ref
  files.delete_if { |file| !file.end_with? "_pb.rb" }
  if files.empty?
    logger.info "No files changed."
  else
    logger.info "Files changed:"
    files.each { |file| logger.info "  #{file}" }
  end
  files
end

def find_modules files
  mods = files.map { |file| module_from file }.compact.sort.uniq
  excluded = mods.find_all { |mod| EXCLUDE_MODULES.any? { |regex| regex.match? mod } }
  logger.info "Modules excluded from check:"
  excluded.each { |mod| logger.info "  #{mod}" }
  mods -= excluded
  logger.info "Modules to check:"
  mods.each { |mod| logger.info "  #{mod}" }
  mods
end

def interpret_github_event
  payload = github_payload_json
  base_ref, head_ref =
    case github_event_name
    when "pull_request"
      logger.info "Getting commits from pull_request event"
      [payload["pull_request"]["base"]["ref"]]
    when "pull_request_target"
      logger.info "Getting commits from pull_request_target event"
      [payload["pull_request"]["base"]["ref"], payload["pull_request"]["head"]["ref"]]
    when "workflow_dispatch"
      logger.info "Getting inputs from workflow_dispatch event"
      [payload["inputs"]["base"], payload["inputs"]["head"]]
    else
      logger.info "Using local commits"
      [base_commit, head_commit]
    end
  base_ref = nil if base_ref&.empty?
  head_ref = nil if head_ref&.empty?
  [base_ref, head_ref]
end

def find_changed_files base_ref
  if base_ref.nil?
    logger.info "No base ref. Using local diff."
    capture(["git", "status", "--porcelain"]).split("\n").map { |line| line.split.last }
  else
    logger.info "Diffing from base ref: #{base_ref}"
    base_sha = ensure_fetched base_ref
    capture(["git", "diff", "--name-only", base_sha], e: true).split("\n").map(&:strip)
  end
end

def ensure_checkout head_ref
  logger.info "Checking for head ref: #{head_ref}"
  head_sha = ensure_fetched head_ref
  current_sha = capture(["git", "rev-parse", "HEAD"], e: true).strip
  if head_sha == current_sha
    logger.info "Already at head SHA: #{head_sha}"
  else
    logger.info "Checking out head SHA: #{head_sha}"
    exec(["git", "checkout", head_sha], e: true)
  end
end

def ensure_fetched ref
  result = exec(["git", "show", "--no-patch", "--format=%H", ref], out: :capture, err: :capture)
  if result.success?
    result.captured_out.strip
  elsif ref == "HEAD^"
    # Common special case
    current_sha = capture(["git", "rev-parse", "HEAD"], e: true).strip
    exec(["git", "fetch", "--depth=2", "origin", current_sha], e: true)
    capture(["git", "rev-parse", "HEAD^"], e: true).strip
  else
    logger.info "Fetching ref: #{ref}"
    exec(["git", "fetch", "--depth=1", "origin", "#{ref}:refs/temp/#{ref}"], e: true)
    capture(["git", "show", "--no-patch", "--format=%H", "refs/temp/#{ref}"], e: true).strip
  end
end

def module_from file
  content = File.read file
  match = /\nmodule Google\n  module Events\n(\s+module \w+\n)+/.match content
  return unless match
  parts = match[0].scan(/\n\s*module (\w+)/).flatten
  parts.slice! 1
  mod = "::#{parts.join("::")}::"
  mod
end

def check_modules modules, dir
  contents = Dir.chdir dir do
    Dir.glob("**/*_services_pb.rb").map { |file| File.read file }
  end
  logger.info "#{contents.size} services files found"
  issues = []
  modules.each do |mod|
    unless contents.any? { |content| content.include? mod }
      issues << "No match for `#{mod}` in google-cloud-ruby"
    end
  end
  issues
end

def output issues
  if github_event_name == "pull_request" && !pr_number
    payload = github_payload_json
    set :pr_number, payload["pull_request"]["number"] if payload
  end
  if pr_number
    if issues.empty?
      comments = ["No warnings detected by check-names.\n"]
    else
      comments = ["WARNINGS:\n\n"]
      issues.each { |issue| comments << " *  #{issue}\n" }
    end
    exec ["gh", "pr", "comment", pr_number,
          "--repo", "googleapis/google-cloudevents-ruby",
          "--body", comments.join],
         e: true
    logger.info "Commented on pull request #{pr_number}"
  else
    issues.each { |issue| puts issue, :bold }
  end
end

def github_payload_json
  unless defined? @github_payload_json
    @github_payload_json = JSON.load File.read github_event_payload rescue nil
  end
  @github_payload_json
end
