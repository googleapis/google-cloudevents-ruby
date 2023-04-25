# frozen_string_literal: true

# Copyright 2023 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require "helper"

describe Google::Events do
  let(:lib_dir) { File.expand_path "../lib", __dir__ }
  let(:proto_files) { Dir.glob "**/*_pb.rb", base: lib_dir }

  it "loads all generated files" do
    Dir.chdir lib_dir do
      proto_files.each { |path| require path }
    end
  end
end
