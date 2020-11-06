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

  Hash   = Strict::Hash
  String = Strict::String
end

# The message that was published.
class Message < Dry::Struct

  # Attributes for this message.
  attribute :attributes, Types::Hash.meta(of: Types::String).optional

  # The binary data in the message.
  attribute :data, Types::String.optional

  # ID of this message, assigned by the server when the message is published.
  # Guaranteed to be unique within the topic.
  attribute :message_id, Types::String.optional
end

# The data received in an event when a message is published to a topic.
class MessagePublishedData < Dry::Struct

  # The message that was published.
  attribute :message, Message.optional

  # The resource name of the subscription for which this event was
  # generated. The format of the value is
  # `projects/{project-id}/subscriptions/{subscription-id}`.
  attribute :subscription, Types::String.optional
end
