# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/events/cloud/redis/v1/events.proto

require 'google/protobuf'

require 'google/events/cloud/redis/v1/data_pb'
require 'google/events/cloudevent_pb'


descriptor_data = "\n)google/events/cloud/redis/v1/events.proto\x12\x1cgoogle.events.cloud.redis.v1\x1a\'google/events/cloud/redis/v1/data.proto\x1a\x1egoogle/events/cloudevent.proto\"\x8f\x01\n\x14InstanceCreatedEvent\x12=\n\x04\x64\x61ta\x18\x01 \x01(\x0b\x32/.google.events.cloud.redis.v1.InstanceEventData:8\xb2\xf8\xd8,&google.cloud.redis.instance.v1.created\xca\xf8\xd8,\x08instance\"\x8f\x01\n\x14InstanceUpdatedEvent\x12=\n\x04\x64\x61ta\x18\x01 \x01(\x0b\x32/.google.events.cloud.redis.v1.InstanceEventData:8\xb2\xf8\xd8,&google.cloud.redis.instance.v1.updated\xca\xf8\xd8,\x08instance\"\x8f\x01\n\x14InstanceDeletedEvent\x12=\n\x04\x64\x61ta\x18\x01 \x01(\x0b\x32/.google.events.cloud.redis.v1.InstanceEventData:8\xb2\xf8\xd8,&google.cloud.redis.instance.v1.deleted\xca\xf8\xd8,\x08instanceB\xd7\x01\xaa\x02%Google.Events.Protobuf.Cloud.Redis.V1\xca\x02\x1cGoogle\\Events\\Cloud\\Redis\\V1\xea\x02 Google::Events::Cloud::Redis::V1\xba\xf8\xd8,\"Google Cloud Memorystore for Redis\xc2\xf8\xd8,A\n\x08instance\x12\x35The resource ID of the Instance triggering the event.b\x06proto3"

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
    ["google.events.cloud.redis.v1.InstanceEventData", "google/events/cloud/redis/v1/data.proto"],
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
      module Redis
        module V1
          InstanceCreatedEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.redis.v1.InstanceCreatedEvent").msgclass
          InstanceUpdatedEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.redis.v1.InstanceUpdatedEvent").msgclass
          InstanceDeletedEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.redis.v1.InstanceDeletedEvent").msgclass
        end
      end
    end
  end
end
