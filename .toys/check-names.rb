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

desc "Verify that event namespaces are consistent with client libraries"

long_desc \
  "Audit a set of changes to event definitions, and check each one against " \
    "the GAPIC code in google-cloud-ruby. Normally, we expect each event to " \
    "have an associated service expressed in one of our client libraries. " \
    "If any discrepancies are discovered, fail and print the results.",
  "",
  "We do this because we want consistency between the Ruby namespaces in the " \
    "client libraries and the Ruby namespaces in the cloud events. Sometimes " \
    "this requires some manual adjustments to the proto options in the event " \
    "protos. For example, the google.events.cloud.pubsub.v1 events should be " \
    "in Ruby namespace Google::Events::Cloud::PubSub::V1 (note the " \
    "capitalization of PubSub) to match the namespace capitalization in the " \
    "PubSub client library, and this requires a proto option. If this check " \
    "flags a discrepancy, it is important to determine why the Ruby name " \
    "being generated for the event does not match what we're doing for the " \
    "client library, and we might need to update some options accordingly.",
  "",
  "It is also possible for this check to flag false positives, in cases " \
    "where there is a known legitimate naming difference. Any such false " \
    "positives should be added to the EXCLUDE_MODULES list in this check's " \
    "source code."

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

require "json"

include :git_cache
include :exec
include :terminal

# Modules to exclude from the check for various reasons.
EXCLUDE_MODULES = [
  # Audit events have no associated client
  /^::Google::Cloud::Audit::/,
  # The beyondcorp/clientconnectorservices client has been turned down
  /^::Google::Cloud::BeyondCorp::ClientConnectorServices::/,
  # The GAPIC name for cloudbuild is google-cloud-build-v1
  /^::Google::Cloud::CloudBuild::/,
  # The IOT client has been turned down
  /^::Google::Cloud::Iot::/,
  # Ruby (currently) has no GAPIC for storage
  /^::Google::Cloud::Storage::/,
  # There is no GAPIC for firebase
  /^::Google::Firebase::/,
]

def run
  Dir.chdir context_directory
  gcr_dir = git_cache.get "https://github.com/googleapis/google-cloud-ruby.git", update: true
  files = find_files
  modules = find_modules files
  issues = check_modules modules, gcr_dir
  output issues
  exit 1 unless issues.empty?
end

##
# Evaluate the current git environment to see what files have changed. If this
# is a pull request, and we have an associated github pull request event, then
# the pull request diff is used. Otherwise, we look for local diffs from HEAD.
#
# @return [Array<String>] An array of file paths
#
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

##
# Given an array of file paths, return a list of associated module names
# (excluding the `Events` module) that we should look for in the client library
# repository.
#
# @param files [Array<String>] An array of changed file paths
# @return [Array<String>] An array of fully-qualified module names
#
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

##
# Get the base and head refs from github.
#
# @return [Array(String|nil, String|nil)] The base and head refs. If this does
#     not appear to be a recognized GitHub event, both values will be nil.
#
def interpret_github_event
  payload = github_payload_json
  base_ref, head_ref =
    case github_event_name
    when "pull_request"
      logger.info "Getting commits from pull_request event"
      [payload["pull_request"]["base"]["sha"], nil]
    when "pull_request_target"
      logger.info "Getting commits from pull_request_target event"
      [payload["pull_request"]["base"]["sha"], payload["pull_request"]["head"]["sha"]]
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

##
# Get a list of changed files.
# If a base ref is given, we look for the diffs from that base ref.
# Otherwise, we look for locally modified files from HEAD.
#
# @param base_ref [String|nil] The base ref, or nil for none
# @return [Array<String>] An array of modified file paths
#
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

##
# Ensure the current head is set to the given head_ref
#
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

##
# Ensure the given ref has been fetched from the remote
#
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

##
# Given a file, return a fully-qualified module name for the events defined in
# the module, omitting the `Events` component of the namespace. The returned
# module name should then be present in an associated client library.
#
# @param file [String] File path
# @return [String] Fully-qualified module name
#
def module_from file
  content = File.read file
  match = /\nmodule Google\n  module Events\n(\s+module \w+\n)+/.match content
  return unless match
  parts = match[0].scan(/\n\s*module (\w+)/).flatten
  # Remove the "Events" module from the namespace, to make it match a module
  # expected from a client library
  parts.slice! 1
  mod = "::#{parts.join("::")}::"
  mod
end

##
# Given a list of module names and a directory, search the directory for GAPIC
# service pb files, and verify that all modules are accounted for in those
# files. Return a list of problems encountered (empty if there are no problems).
#
# @param modules [Array<String>] List of fully-qualified module names
# @param dir [String] Path to the google-cloud-ruby repository
# @return [Array<String>] List of descriptions of problems found, or empty if
#     no problems found
#
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

##
# Print out results
#
# @param issues [Array<String>] Issue list
#
def output issues
  if issues.empty?
    puts "No naming issues", :green, :bold
  else
    puts "NAMING ISSUES FOUND:", :red, :bold
    issues.each { |issue| puts issue, :red, :bold }
  end
end

##
# Memoized github event payload
#
# @return [Object] Deserialized event payload
#
def github_payload_json
  unless defined? @github_payload_json
    @github_payload_json = JSON.load File.read github_event_payload rescue nil
  end
  @github_payload_json
end
