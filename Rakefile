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

require "bundler/gem_tasks"
require "open3"
require "rake/clean"
require "rake/testtask"
require "rubocop/rake_task"
require "yard"

# The entries in .gitignore.
CLEAN.include ".bundle", ".yardoc", "_yardoc", "coverage", "doc", "pkg", "spec/reports", "tmp"

Rake::TestTask.new :test do |t|
  t.libs = ["lib", "test"]
  t.test_files = FileList["test/**/test_*.rb", "test/**/*_test.rb"]
end

RuboCop::RakeTask.new

desc "Generate YARD documentation (YARDOC_OUTPUT=false only checks for warnings)"
YARD::Rake::YardocTask.new :yardoc do |t|
  t.options = ["--fail-on-warning", "--no-stats"]
  t.options << "--no-output" if ENV["YARDOC_OUTPUT"] == "false"
  # Also fail if `yard stats --list-undoc` reports undocumented objects.
  t.after = lambda do
    stats, status = Open3.capture2 RbConfig.ruby, "-e",
                                   "require 'yard'; YARD::CLI::Stats.run('--list-undoc', '--use-cache')"
    puts stats
    abort "Yardoc encountered errors" unless status.success?
    abort "Yardoc encountered undocumented objects" if stats =~ /Undocumented\sObjects:/
  end
end

desc "Alias for yardoc, used by the release tooling"
task yard: :yardoc

desc "Run CI checks"
task ci: ["test", "rubocop", "yardoc", "build"]
