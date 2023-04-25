# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/events/firebase/auth/v1/data.proto

require 'google/protobuf'

require 'google/protobuf/struct_pb'
require 'google/protobuf/timestamp_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/events/firebase/auth/v1/data.proto", :syntax => :proto3) do
    add_message "google.events.firebase.auth.v1.AuthEventData" do
      optional :uid, :string, 1
      optional :email, :string, 2
      optional :email_verified, :bool, 3
      optional :display_name, :string, 4
      optional :photo_URL, :string, 5
      optional :disabled, :bool, 6
      optional :metadata, :message, 7, "google.events.firebase.auth.v1.UserMetadata"
      repeated :provider_data, :message, 8, "google.events.firebase.auth.v1.UserInfo"
      optional :phone_number, :string, 9
      optional :custom_claims, :message, 10, "google.protobuf.Struct"
    end
    add_message "google.events.firebase.auth.v1.UserMetadata" do
      optional :create_time, :message, 1, "google.protobuf.Timestamp"
      optional :last_sign_in_time, :message, 2, "google.protobuf.Timestamp"
    end
    add_message "google.events.firebase.auth.v1.UserInfo" do
      optional :uid, :string, 1
      optional :email, :string, 2
      optional :display_name, :string, 3
      optional :photo_URL, :string, 4
      optional :provider_id, :string, 5
    end
  end
end

module Google
  module Events
    module Firebase
      module Auth
        module V1
          AuthEventData = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.firebase.auth.v1.AuthEventData").msgclass
          UserMetadata = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.firebase.auth.v1.UserMetadata").msgclass
          UserInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.firebase.auth.v1.UserInfo").msgclass
        end
      end
    end
  end
end
