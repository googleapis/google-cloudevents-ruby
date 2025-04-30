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

lib = File.expand_path "lib", __dir__
$LOAD_PATH.unshift lib unless $LOAD_PATH.include? lib
require "google/events/version"
version = ::Google::Events::VERSION

::Gem::Specification.new do |spec|
  spec.name = "google-events"
  spec.version = version
  spec.authors = ["Daniel Azuma"]
  spec.email = ["dazuma@google.com"]

  spec.summary = "Google CloudEvents types for Ruby"
  spec.description =
    "This library includes Google CloudEvents types for Ruby"
  spec.license = "Apache-2.0"
  spec.homepage = "https://github.com/googleapis/google-cloudevents-ruby"

  spec.files = ::Dir.glob("lib/**/*.rb") +
               ::Dir.glob("*.md") +
               ["LICENSE", ".yardopts"]
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 3.1"

  spec.add_dependency "googleapis-common-protos-types", "~> 1.6"
  spec.add_dependency "google-protobuf", ">= 3.25", "< 5.a"

  if spec.respond_to? :metadata
    spec.metadata["source_code_uri"] = "https://github.com/googleapis/google-cloudevents-ruby"
    spec.metadata["bug_tracker_uri"] = "https://github.com/googleapis/google-cloudevents-ruby/issues"
    spec.metadata["documentation_uri"] = "https://rubydoc.info/gems/google-cloudevents-ruby"
  end
end
