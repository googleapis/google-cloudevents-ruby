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

flag :clean, "--[no-]clean" do
  desc "Clean out old generated files. Default is true."
  default true
end
flag :gen, "--[no-]gen" do
  desc "Generate new files. Default is true."
  default true
end
flag :update_source, "--[no-]update-source" do
  desc "Force a git pull of the source proto cache. Default is true."
  default true
end
flag :git_remote, "--remote=NAME" do
  desc "The name of the git remote to use as the pull request head. If omitted, does not open a pull request."
end
flag :enable_fork, "--fork" do
  desc "The github user for whom to create/use a fork"
end

include :git_cache
include :exec, e: true
include :gems
include :fileutils
include :terminal
include "yoshi-pr-generator"

def run
  cd context_directory
  prepare_changes
  result = make_changes
  output_result result
end

def prepare_changes
  yoshi_utils.git_ensure_identity
  if enable_fork
    set :git_remote, "pull-request-fork" unless git_remote
    yoshi_utils.gh_ensure_fork remote: git_remote
  end
end

def make_changes
  timestamp = Time.now.utc.strftime "%Y%m%d-%H%M%S"
  branch_name = "gen/#{timestamp}"
  commit_message = "feat: Automated update of event classes"
  return :exists if open_pr_exists? commit_message
  yoshi_pr_generator.capture enabled: !git_remote.nil?,
                             remote: git_remote,
                             branch_name: branch_name,
                             commit_message: commit_message do
    do_clean if clean
    do_gen if gen
  end
end

def output_result result
  case result
  when Integer
    puts "Opened pull request #{result}", :green, :bold
  when :unchanged
    puts "No changes", :magenta
  when :exists
    puts "Pull request already exists", :yellow
  else
    puts "Updated code but did not open a pull request", :cyan
  end
end

def open_pr_exists? title
  require "json"
  content = capture ["gh", "pr", "list", "--search", "\"#{title}\" in:title", "--state=open", "--json=number"]
  !JSON.parse(content).empty?
end

def do_clean
  Dir.glob("lib/**/*_pb.rb") { |path| rm path }
end

def do_gen
  gem "grpc-tools", "~> 1.54"
  googleapis_directory = git_cache.get "https://github.com/googleapis/googleapis.git",
                                       update: update_source
  proto_directory = git_cache.get "https://github.com/googleapis/google-cloudevents.git",
                                  path: "proto",
                                  update: update_source
  proto_files = Dir.glob "#{proto_directory}/**/*.proto"
  cmd = [
    "grpc_tools_ruby_protoc",
    "--ruby_out=lib",
    "-I", proto_directory,
    "-I", googleapis_directory,
  ] + proto_files
  exec cmd
end
