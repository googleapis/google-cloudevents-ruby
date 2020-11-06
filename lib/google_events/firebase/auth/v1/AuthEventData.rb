# Copyright 2020 Google LLC
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

require 'json'
require 'dry-types'
require 'dry-struct'

module Types
  include Dry::Types.module

  Nil    = Strict::Nil
  Bool   = Strict::Bool
  Hash   = Strict::Hash
  String = Strict::String
end

# User's custom claims, typically used to define user roles and propagated
# to an authenticated user's ID token.
class CustomClaims < Dry::Struct

  # Unordered map of dynamically typed values.
  attribute :fields, Types::Hash.meta(of: Types::Hash.meta(of: Types::Any).optional).optional
end

# Additional metadata about the user.
class Metadata < Dry::Struct

  # The date the user was created.
  attribute :created_at, Types::String.optional

  # The date the user last signed in.
  attribute :last_signed_in_at, Types::String.optional
end

# User's info at the identity provider
class ProviderDatum < Dry::Struct

  # The display name for the linked provider.
  attribute :display_name, Types::String.optional

  # The email for the linked provider.
  attribute :email, Types::String.optional

  # The photo URL for the linked provider.
  attribute :photo_url, Types::String.optional

  # The linked provider ID (e.g. "google.com" for the Google provider).
  attribute :provider_id, Types::String.optional

  # The user identifier for the linked provider.
  attribute :uid, Types::String.optional
end

# The data within all Firebase Auth events
class AuthEventData < Dry::Struct

  # User's custom claims, typically used to define user roles and propagated
  # to an authenticated user's ID token.
  attribute :custom_claims, CustomClaims.optional

  # Whether the user is disabled.
  attribute :disabled, Types::Bool.optional

  # The user's display name.
  attribute :display_name, Types::String.optional

  # The user's primary email, if set.
  attribute :email, Types::String.optional

  # Whether or not the user's primary email is verified.
  attribute :email_verified, Types::Bool.optional

  # Additional metadata about the user.
  attribute :metadata, Metadata.optional

  # The user's phone number.
  attribute :phone_number, Types::String.optional

  # The user's photo URL.
  attribute :photo_url, Types::String.optional

  # User's info at the providers
  attribute :provider_data, Types.Array(ProviderDatum).optional

  # The user identifier in the Firebase app.
  attribute :uid, Types::String.optional
end
