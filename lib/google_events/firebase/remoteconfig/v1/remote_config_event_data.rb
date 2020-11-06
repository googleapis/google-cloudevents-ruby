# Copyright 2020 Google LLC
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

require 'json'
require 'dry-types'
require 'dry-struct'

module Types
  include Dry::Types.module

  Int    = Strict::Int
  Hash   = Strict::Hash
  String = Strict::String
end

class RollbackSource < Dry::Struct
  attribute :integer, Types::Int.optional
  attribute :string,  Types::String.optional
end

# Aggregation of all metadata fields about the account that performed the update.
class UpdateUser < Dry::Struct

  # Email address.
  attribute :email, Types::String.optional

  # Image URL.
  attribute :image_url, Types::String.optional

  # Display name.
  attribute :update_user_name, Types::String.optional
end

# The data within all Firebase Remote Config events.
class RemoteConfigEventData < Dry::Struct

  # The user-provided description of the corresponding Remote Config template.
  attribute :description, Types::String.optional

  # Only present if this version is the result of a rollback, and will be the
  # version number of the Remote Config template that was rolled-back to.
  attribute :rollback_source, Types.Instance(RollbackSource).optional

  # Where the update action originated.
  attribute :update_origin, Types.Instance(RollbackSource).optional

  # When the Remote Config template was written to the Remote Config server.
  attribute :update_time, Types::String.optional

  # What type of update was made.
  attribute :update_type, Types.Instance(RollbackSource).optional

  # Aggregation of all metadata fields about the account that performed the update.
  attribute :update_user, UpdateUser.optional

  # The version number of the version's corresponding Remote Config template.
  attribute :version_number, Types.Instance(RollbackSource).optional
end
