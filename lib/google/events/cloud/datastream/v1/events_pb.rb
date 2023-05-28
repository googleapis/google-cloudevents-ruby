# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/events/cloud/datastream/v1/events.proto

require 'google/protobuf'

require 'google/events/cloud/datastream/v1/data_pb'
require 'google/events/cloudevent_pb'


descriptor_data = "\n.google/events/cloud/datastream/v1/events.proto\x12!google.events.cloud.datastream.v1\x1a,google/events/cloud/datastream/v1/data.proto\x1a\x1egoogle/events/cloudevent.proto\"\xbd\x01\n\x1d\x43onnectionProfileCreatedEvent\x12K\n\x04\x64\x61ta\x18\x01 \x01(\x0b\x32=.google.events.cloud.datastream.v1.ConnectionProfileEventData:O\xb2\xf8\xd8,4google.cloud.datastream.connectionProfile.v1.created\xca\xf8\xd8,\x11\x63onnectionprofile\"\xbd\x01\n\x1d\x43onnectionProfileUpdatedEvent\x12K\n\x04\x64\x61ta\x18\x01 \x01(\x0b\x32=.google.events.cloud.datastream.v1.ConnectionProfileEventData:O\xb2\xf8\xd8,4google.cloud.datastream.connectionProfile.v1.updated\xca\xf8\xd8,\x11\x63onnectionprofile\"\xbd\x01\n\x1d\x43onnectionProfileDeletedEvent\x12K\n\x04\x64\x61ta\x18\x01 \x01(\x0b\x32=.google.events.cloud.datastream.v1.ConnectionProfileEventData:O\xb2\xf8\xd8,4google.cloud.datastream.connectionProfile.v1.deleted\xca\xf8\xd8,\x11\x63onnectionprofile\"\x91\x01\n\x12StreamCreatedEvent\x12@\n\x04\x64\x61ta\x18\x01 \x01(\x0b\x32\x32.google.events.cloud.datastream.v1.StreamEventData:9\xb2\xf8\xd8,)google.cloud.datastream.stream.v1.created\xca\xf8\xd8,\x06stream\"\x91\x01\n\x12StreamUpdatedEvent\x12@\n\x04\x64\x61ta\x18\x01 \x01(\x0b\x32\x32.google.events.cloud.datastream.v1.StreamEventData:9\xb2\xf8\xd8,)google.cloud.datastream.stream.v1.updated\xca\xf8\xd8,\x06stream\"\x91\x01\n\x12StreamDeletedEvent\x12@\n\x04\x64\x61ta\x18\x01 \x01(\x0b\x32\x32.google.events.cloud.datastream.v1.StreamEventData:9\xb2\xf8\xd8,)google.cloud.datastream.stream.v1.deleted\xca\xf8\xd8,\x06stream\"\xbd\x01\n\x1dPrivateConnectionCreatedEvent\x12K\n\x04\x64\x61ta\x18\x01 \x01(\x0b\x32=.google.events.cloud.datastream.v1.PrivateConnectionEventData:O\xb2\xf8\xd8,4google.cloud.datastream.privateConnection.v1.created\xca\xf8\xd8,\x11privateconnection\"\xbd\x01\n\x1dPrivateConnectionDeletedEvent\x12K\n\x04\x64\x61ta\x18\x01 \x01(\x0b\x32=.google.events.cloud.datastream.v1.PrivateConnectionEventData:O\xb2\xf8\xd8,4google.cloud.datastream.privateConnection.v1.deleted\xca\xf8\xd8,\x11privateconnection\"\xa3\x01\n\x11RouteCreatedEvent\x12?\n\x04\x64\x61ta\x18\x01 \x01(\x0b\x32\x31.google.events.cloud.datastream.v1.RouteEventData:M\xb2\xf8\xd8,(google.cloud.datastream.route.v1.created\xca\xf8\xd8,\x11privateconnection\xca\xf8\xd8,\x05route\"\xa3\x01\n\x11RouteDeletedEvent\x12?\n\x04\x64\x61ta\x18\x01 \x01(\x0b\x32\x31.google.events.cloud.datastream.v1.RouteEventData:M\xb2\xf8\xd8,(google.cloud.datastream.route.v1.deleted\xca\xf8\xd8,\x11privateconnection\xca\xf8\xd8,\x05routeB\xe0\x03\xaa\x02*Google.Events.Protobuf.Cloud.Datastream.V1\xca\x02!Google\\Events\\Cloud\\Datastream\\V1\xea\x02%Google::Events::Cloud::Datastream::V1\xba\xf8\xd8,\nDatastream\xc2\xf8\xd8,f\n\x11\x63onnectionprofile\x12>The resource ID of the ConnectionProfile triggering the event.\x1a\x11\x63onnectionProfile\xc2\xf8\xd8,=\n\x06stream\x12\x33The resource ID of the Stream triggering the event.\xc2\xf8\xd8,f\n\x11privateconnection\x12>The resource ID of the PrivateConnection triggering the event.\x1a\x11privateConnection\xc2\xf8\xd8,;\n\x05route\x12\x32The resource ID of the Route triggering the event.b\x06proto3"

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
    ["google.events.cloud.datastream.v1.ConnectionProfileEventData", "google/events/cloud/datastream/v1/data.proto"],
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
      module Datastream
        module V1
          ConnectionProfileCreatedEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.datastream.v1.ConnectionProfileCreatedEvent").msgclass
          ConnectionProfileUpdatedEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.datastream.v1.ConnectionProfileUpdatedEvent").msgclass
          ConnectionProfileDeletedEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.datastream.v1.ConnectionProfileDeletedEvent").msgclass
          StreamCreatedEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.datastream.v1.StreamCreatedEvent").msgclass
          StreamUpdatedEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.datastream.v1.StreamUpdatedEvent").msgclass
          StreamDeletedEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.datastream.v1.StreamDeletedEvent").msgclass
          PrivateConnectionCreatedEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.datastream.v1.PrivateConnectionCreatedEvent").msgclass
          PrivateConnectionDeletedEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.datastream.v1.PrivateConnectionDeletedEvent").msgclass
          RouteCreatedEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.datastream.v1.RouteCreatedEvent").msgclass
          RouteDeletedEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.datastream.v1.RouteDeletedEvent").msgclass
        end
      end
    end
  end
end
