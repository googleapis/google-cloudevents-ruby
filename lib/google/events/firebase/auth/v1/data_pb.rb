# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/events/firebase/auth/v1/data.proto

require 'google/protobuf'

require 'google/protobuf/struct_pb'
require 'google/protobuf/timestamp_pb'


descriptor_data = "\n)google/events/firebase/auth/v1/data.proto\x12\x1egoogle.events.firebase.auth.v1\x1a\x1cgoogle/protobuf/struct.proto\x1a\x1fgoogle/protobuf/timestamp.proto\"\xc5\x02\n\rAuthEventData\x12\x0b\n\x03uid\x18\x01 \x01(\t\x12\r\n\x05\x65mail\x18\x02 \x01(\t\x12\x16\n\x0e\x65mail_verified\x18\x03 \x01(\x08\x12\x14\n\x0c\x64isplay_name\x18\x04 \x01(\t\x12\x11\n\tphoto_URL\x18\x05 \x01(\t\x12\x10\n\x08\x64isabled\x18\x06 \x01(\x08\x12>\n\x08metadata\x18\x07 \x01(\x0b\x32,.google.events.firebase.auth.v1.UserMetadata\x12?\n\rprovider_data\x18\x08 \x03(\x0b\x32(.google.events.firebase.auth.v1.UserInfo\x12\x14\n\x0cphone_number\x18\t \x01(\t\x12.\n\rcustom_claims\x18\n \x01(\x0b\x32\x17.google.protobuf.Struct\"v\n\x0cUserMetadata\x12/\n\x0b\x63reate_time\x18\x01 \x01(\x0b\x32\x1a.google.protobuf.Timestamp\x12\x35\n\x11last_sign_in_time\x18\x02 \x01(\x0b\x32\x1a.google.protobuf.Timestamp\"d\n\x08UserInfo\x12\x0b\n\x03uid\x18\x01 \x01(\t\x12\r\n\x05\x65mail\x18\x02 \x01(\t\x12\x14\n\x0c\x64isplay_name\x18\x03 \x01(\t\x12\x11\n\tphoto_URL\x18\x04 \x01(\t\x12\x13\n\x0bprovider_id\x18\x05 \x01(\tBp\xaa\x02\'Google.Events.Protobuf.Firebase.Auth.V1\xca\x02\x1eGoogle\\Events\\Firebase\\Auth\\V1\xea\x02\"Google::Events::Firebase::Auth::V1b\x06proto3"

pool = Google::Protobuf::DescriptorPool.generated_pool
pool.add_serialized_file(descriptor_data)

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
