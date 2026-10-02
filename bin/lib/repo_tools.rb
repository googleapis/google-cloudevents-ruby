# frozen_string_literal: true

# Copyright 2026 Google LLC
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

require "fileutils"
require "open3"
require "optparse"

##
# Helpers shared by the maintenance scripts in `bin/`. They use only default
# gems, so the scripts run with a plain `ruby` and no bundle, even when
# GEM_PATH points at a private directory as it does in the workflows. (That
# rules out `logger`, which is a bundled gem as of Ruby 4.0.)
#
module RepoTools
  ##
  # The root directory of the repository.
  #
  ROOT = File.expand_path "../..", __dir__

  private

  ##
  # Add the `-v`/`--verbose` and `-q`/`--quiet` flags (both repeatable) to a
  # parser, then parse the arguments. On a usage error, including unexpected
  # positional arguments, prints the error and exits with status 2.
  #
  # @param parser [OptionParser]
  # @param argv [Array<String>]
  #
  def parse_options! parser, argv
    @verbosity = 0
    parser.on("-v", "--verbose", "Increase verbosity") { @verbosity += 1 }
    parser.on("-q", "--quiet", "Decrease verbosity") { @verbosity -= 1 }
    parser.parse! argv
    raise OptionParser::ParseError, "extra arguments: #{argv.join ' '}" unless argv.empty?
  rescue OptionParser::ParseError => e
    warn e.message
    warn "Run with --help for usage."
    exit 2
  end

  ##
  # Write an informational message to stderr. Shown only with `-v`.
  #
  # @param message [String]
  #
  def log_info message
    warn "[INFO] #{message}" if @verbosity.to_i.positive?
  end

  ##
  # Write an error message to stderr. Hidden only with `-qq`.
  #
  # @param message [String]
  #
  def log_error message
    warn "[ERROR] #{message}" if @verbosity.to_i >= -1
  end

  ##
  # Run a command. If it fails and `exit_on_failure` is set, exit with the
  # command's status.
  #
  # @param cmd [Array<String>] The command and its arguments.
  # @param exit_on_failure [boolean] Exit if the command fails. Default is true.
  # @param log_cmd [Array<String>,nil] What to log instead of the command, to
  #     keep secrets out of the logs.
  # @param opts [Hash] Options passed to `Kernel#system`, such as `out:`.
  # @return [Process::Status]
  #
  def run cmd, exit_on_failure: true, log_cmd: nil, **opts
    log_info "exec: #{(log_cmd || cmd).inspect}"
    system(*cmd, **opts)
    status = Process.last_status
    exit_with status if exit_on_failure && !status.success?
    status
  end

  ##
  # Run a command and return its standard output.
  #
  # @param cmd [Array<String>] The command and its arguments.
  # @param exit_on_failure [boolean] Exit if the command fails. Default is true.
  # @param opts [Hash] Options passed to `Open3.capture2`, such as `err:`.
  # @return [String]
  #
  def capture cmd, exit_on_failure: true, **opts
    out, status = capture_with_status cmd, **opts
    exit_with status if exit_on_failure && !status.success?
    out
  end

  ##
  # Run a command and return its standard output and status. Exits with
  # status 127 if the command is not installed.
  #
  # @param cmd [Array<String>] The command and its arguments.
  # @param opts [Hash] Options passed to `Open3.capture2`, such as `err:`.
  # @return [Array(String, Process::Status)]
  #
  def capture_with_status cmd, **opts
    log_info "exec: #{cmd.inspect}"
    Open3.capture2(*cmd, **opts)
  rescue Errno::ENOENT
    log_error "Command not found: #{cmd.first}"
    exit 127
  end

  ##
  # Return the path to a shallow clone of the default branch of a remote
  # repository, kept under `$XDG_CACHE_HOME/google-cloudevents-ruby`. An
  # existing clone is reused as is unless `update` is set, in which case it is
  # first moved to the latest commit on the remote.
  #
  # @param url [String] The git remote URL.
  # @param update [boolean] Whether to fetch the latest commit.
  # @return [String]
  #
  def cached_repo url, update:
    cache_home = ENV["XDG_CACHE_HOME"].to_s
    cache_home = File.join Dir.home, ".cache" if cache_home.empty?
    dir = File.join cache_home, "google-cloudevents-ruby", File.basename(url, ".git")
    if !File.directory? File.join(dir, ".git")
      FileUtils.rm_rf dir
      FileUtils.mkdir_p File.dirname(dir)
      run ["git", "clone", "--quiet", "--depth=1", url, dir]
    elsif update
      run ["git", "-C", dir, "fetch", "--quiet", "--depth=1", "origin", "HEAD"]
      run ["git", "-C", dir, "reset", "--quiet", "--hard", "FETCH_HEAD"]
    end
    dir
  end

  def exit_with status
    log_error "Command failed with exit status #{status.exitstatus.inspect}"
    exit(status.exitstatus || 1)
  end
end
