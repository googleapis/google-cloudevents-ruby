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

if ENV["RUBY_COMMON_TOOLS"]
  common_tools_dir = File.expand_path ENV["RUBY_COMMON_TOOLS"]
  load File.join(common_tools_dir, "toys", "yoshi")
else
  load_git remote: "https://github.com/googleapis/ruby-common-tools.git",
           path: "toys/yoshi",
           update: true
end

expand :clean, paths: :gitignore

expand :minitest, libs: ["lib", "test"], bundler: true

expand :rubocop, bundler: true

expand :yardoc do |t|
  t.generate_output_flag = true
  t.fail_on_warning = true
  t.fail_on_undocumented_objects = true
  t.use_bundler
end
alias_tool :yard, :yardoc

expand :gem_build

expand :gem_build, name: "install", install_gem: true
