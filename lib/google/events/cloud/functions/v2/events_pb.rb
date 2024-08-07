# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/events/cloud/functions/v2/events.proto

require 'google/protobuf'

require 'google/events/cloud/functions/v2/data_pb'
require 'google/events/cloudevent_pb'


descriptor_data = "\n-google/events/cloud/functions/v2/events.proto\x12 google.events.cloud.functions.v2\x1a+google/events/cloud/functions/v2/data.proto\x1a\x1egoogle/events/cloudevent.proto\"\x97\x01\n\x14\x46unctionCreatedEvent\x12\x41\n\x04\x64\x61ta\x18\x01 \x01(\x0b\x32\x33.google.events.cloud.functions.v2.FunctionEventData:<\xb2\xf8\xd8,*google.cloud.functions.function.v2.created\xca\xf8\xd8,\x08\x66unction\"\x97\x01\n\x14\x46unctionUpdatedEvent\x12\x41\n\x04\x64\x61ta\x18\x01 \x01(\x0b\x32\x33.google.events.cloud.functions.v2.FunctionEventData:<\xb2\xf8\xd8,*google.cloud.functions.function.v2.updated\xca\xf8\xd8,\x08\x66unction\"\x97\x01\n\x14\x46unctionDeletedEvent\x12\x41\n\x04\x64\x61ta\x18\x01 \x01(\x0b\x32\x33.google.events.cloud.functions.v2.FunctionEventData:<\xb2\xf8\xd8,*google.cloud.functions.function.v2.deleted\xca\xf8\xd8,\x08\x66unctionB\xd0\x01\xaa\x02)Google.Events.Protobuf.Cloud.Functions.V2\xca\x02 Google\\Events\\Cloud\\Functions\\V2\xea\x02$Google::Events::Cloud::Functions::V2\xba\xf8\xd8,\x0f\x43loud Functions\xc2\xf8\xd8,A\n\x08\x66unction\x12\x35The resource ID of the Function triggering the event.b\x06proto3"

pool = Google::Protobuf::DescriptorPool.generated_pool
pool.add_serialized_file(descriptor_data)

module Google
  module Events
    module Cloud
      module Functions
        module V2
          FunctionCreatedEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.functions.v2.FunctionCreatedEvent").msgclass
          FunctionUpdatedEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.functions.v2.FunctionUpdatedEvent").msgclass
          FunctionDeletedEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.functions.v2.FunctionDeletedEvent").msgclass
        end
      end
    end
  end
end
