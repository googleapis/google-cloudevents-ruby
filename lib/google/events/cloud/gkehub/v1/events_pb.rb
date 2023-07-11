# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/events/cloud/gkehub/v1/events.proto

require 'google/protobuf'

require 'google/events/cloud/gkehub/v1/data_pb'
require 'google/events/cloudevent_pb'


descriptor_data = "\n*google/events/cloud/gkehub/v1/events.proto\x12\x1dgoogle.events.cloud.gkehub.v1\x1a(google/events/cloud/gkehub/v1/data.proto\x1a\x1egoogle/events/cloudevent.proto\"\x99\x01\n\x16MembershipCreatedEvent\x12@\n\x04\x64\x61ta\x18\x01 \x01(\x0b\x32\x32.google.events.cloud.gkehub.v1.MembershipEventData:=\xb2\xf8\xd8,)google.cloud.gkehub.membership.v1.created\xca\xf8\xd8,\nmembership\"\x8d\x01\n\x13\x46\x65\x61tureCreatedEvent\x12=\n\x04\x64\x61ta\x18\x01 \x01(\x0b\x32/.google.events.cloud.gkehub.v1.FeatureEventData:7\xb2\xf8\xd8,&google.cloud.gkehub.feature.v1.created\xca\xf8\xd8,\x07\x66\x65\x61ture\"\x99\x01\n\x16MembershipDeletedEvent\x12@\n\x04\x64\x61ta\x18\x01 \x01(\x0b\x32\x32.google.events.cloud.gkehub.v1.MembershipEventData:=\xb2\xf8\xd8,)google.cloud.gkehub.membership.v1.deleted\xca\xf8\xd8,\nmembership\"\x8d\x01\n\x13\x46\x65\x61tureDeletedEvent\x12=\n\x04\x64\x61ta\x18\x01 \x01(\x0b\x32/.google.events.cloud.gkehub.v1.FeatureEventData:7\xb2\xf8\xd8,&google.cloud.gkehub.feature.v1.deleted\xca\xf8\xd8,\x07\x66\x65\x61ture\"\x99\x01\n\x16MembershipUpdatedEvent\x12@\n\x04\x64\x61ta\x18\x01 \x01(\x0b\x32\x32.google.events.cloud.gkehub.v1.MembershipEventData:=\xb2\xf8\xd8,)google.cloud.gkehub.membership.v1.updated\xca\xf8\xd8,\nmembership\"\x8d\x01\n\x13\x46\x65\x61tureUpdatedEvent\x12=\n\x04\x64\x61ta\x18\x01 \x01(\x0b\x32/.google.events.cloud.gkehub.v1.FeatureEventData:7\xb2\xf8\xd8,&google.cloud.gkehub.feature.v1.updated\xca\xf8\xd8,\x07\x66\x65\x61ture\"\x85\x01\n\x11ScopeCreatedEvent\x12;\n\x04\x64\x61ta\x18\x01 \x01(\x0b\x32-.google.events.cloud.gkehub.v1.ScopeEventData:3\xb2\xf8\xd8,$google.cloud.gkehub.scope.v1.created\xca\xf8\xd8,\x05scope\"\x85\x01\n\x11ScopeDeletedEvent\x12;\n\x04\x64\x61ta\x18\x01 \x01(\x0b\x32-.google.events.cloud.gkehub.v1.ScopeEventData:3\xb2\xf8\xd8,$google.cloud.gkehub.scope.v1.deleted\xca\xf8\xd8,\x05scope\"\xc4\x01\n\x1dMembershipBindingCreatedEvent\x12G\n\x04\x64\x61ta\x18\x01 \x01(\x0b\x32\x39.google.events.cloud.gkehub.v1.MembershipBindingEventData:Z\xb2\xf8\xd8,0google.cloud.gkehub.membershipBinding.v1.created\xca\xf8\xd8,\nmembership\xca\xf8\xd8,\x11membershipbinding\"\xc4\x01\n\x1dMembershipBindingUpdatedEvent\x12G\n\x04\x64\x61ta\x18\x01 \x01(\x0b\x32\x39.google.events.cloud.gkehub.v1.MembershipBindingEventData:Z\xb2\xf8\xd8,0google.cloud.gkehub.membershipBinding.v1.updated\xca\xf8\xd8,\nmembership\xca\xf8\xd8,\x11membershipbinding\"\xc4\x01\n\x1dMembershipBindingDeletedEvent\x12G\n\x04\x64\x61ta\x18\x01 \x01(\x0b\x32\x39.google.events.cloud.gkehub.v1.MembershipBindingEventData:Z\xb2\xf8\xd8,0google.cloud.gkehub.membershipBinding.v1.deleted\xca\xf8\xd8,\nmembership\xca\xf8\xd8,\x11membershipbindingB\xb2\x03\xaa\x02&Google.Events.Protobuf.Cloud.GkeHub.V1\xca\x02\x1dGoogle\\Events\\Cloud\\GkeHub\\V1\xea\x02!Google::Events::Cloud::GkeHub::V1\xba\xf8\xd8,\x07GKE Hub\xc2\xf8\xd8,E\n\nmembership\x12\x37The resource ID of the Membership triggering the event.\xc2\xf8\xd8,?\n\x07\x66\x65\x61ture\x12\x34The resource ID of the Feature triggering the event.\xc2\xf8\xd8,;\n\x05scope\x12\x32The resource ID of the Scope triggering the event.\xc2\xf8\xd8,f\n\x11membershipbinding\x12>The resource ID of the MembershipBinding triggering the event.\x1a\x11membershipBindingb\x06proto3"

pool = Google::Protobuf::DescriptorPool.generated_pool

begin
  pool.add_serialized_file(descriptor_data)
rescue TypeError => e
  # Compatibility code: will be removed in the next major version.
  require 'google/protobuf/descriptor_pb'
  parsed = Google::Protobuf::FileDescriptorProto.decode(descriptor_data)
  parsed.clear_dependency
  serialized = parsed.class.encode(parsed)
  file = pool.add_serialized_file(serialized)
  warn "Warning: Protobuf detected an import path issue while loading generated file #{__FILE__}"
  imports = [
    ["google.events.cloud.gkehub.v1.MembershipEventData", "google/events/cloud/gkehub/v1/data.proto"],
  ]
  imports.each do |type_name, expected_filename|
    import_file = pool.lookup(type_name).file_descriptor
    if import_file.name != expected_filename
      warn "- #{file.name} imports #{expected_filename}, but that import was loaded as #{import_file.name}"
    end
  end
  warn "Each proto file must use a consistent fully-qualified name."
  warn "This will become an error in the next major version."
end

module Google
  module Events
    module Cloud
      module GkeHub
        module V1
          MembershipCreatedEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.gkehub.v1.MembershipCreatedEvent").msgclass
          FeatureCreatedEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.gkehub.v1.FeatureCreatedEvent").msgclass
          MembershipDeletedEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.gkehub.v1.MembershipDeletedEvent").msgclass
          FeatureDeletedEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.gkehub.v1.FeatureDeletedEvent").msgclass
          MembershipUpdatedEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.gkehub.v1.MembershipUpdatedEvent").msgclass
          FeatureUpdatedEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.gkehub.v1.FeatureUpdatedEvent").msgclass
          ScopeCreatedEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.gkehub.v1.ScopeCreatedEvent").msgclass
          ScopeDeletedEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.gkehub.v1.ScopeDeletedEvent").msgclass
          MembershipBindingCreatedEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.gkehub.v1.MembershipBindingCreatedEvent").msgclass
          MembershipBindingUpdatedEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.gkehub.v1.MembershipBindingUpdatedEvent").msgclass
          MembershipBindingDeletedEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.gkehub.v1.MembershipBindingDeletedEvent").msgclass
        end
      end
    end
  end
end