# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/events/cloud/beyondcorp/clientconnectorservices/v1/events.proto

require 'google/protobuf'

require 'google/events/cloud/beyondcorp/clientconnectorservices/v1/data_pb'
require 'google/events/cloudevent_pb'


descriptor_data = "\nFgoogle/events/cloud/beyondcorp/clientconnectorservices/v1/events.proto\x12\x39google.events.cloud.beyondcorp.clientconnectorservices.v1\x1a\x44google/events/cloud/beyondcorp/clientconnectorservices/v1/data.proto\x1a\x1egoogle/events/cloudevent.proto\"\x81\x02\n\"ClientConnectorServiceCreatedEvent\x12h\n\x04\x64\x61ta\x18\x01 \x01(\x0b\x32Z.google.events.cloud.beyondcorp.clientconnectorservices.v1.ClientConnectorServiceEventData:q\xb2\xf8\xd8,Qgoogle.cloud.beyondcorp.clientconnectorservices.clientConnectorService.v1.created\xca\xf8\xd8,\x16\x63lientconnectorservice\"\x81\x02\n\"ClientConnectorServiceUpdatedEvent\x12h\n\x04\x64\x61ta\x18\x01 \x01(\x0b\x32Z.google.events.cloud.beyondcorp.clientconnectorservices.v1.ClientConnectorServiceEventData:q\xb2\xf8\xd8,Qgoogle.cloud.beyondcorp.clientconnectorservices.clientConnectorService.v1.updated\xca\xf8\xd8,\x16\x63lientconnectorservice\"\x81\x02\n\"ClientConnectorServiceDeletedEvent\x12h\n\x04\x64\x61ta\x18\x01 \x01(\x0b\x32Z.google.events.cloud.beyondcorp.clientconnectorservices.v1.ClientConnectorServiceEventData:q\xb2\xf8\xd8,Qgoogle.cloud.beyondcorp.clientconnectorservices.clientConnectorService.v1.deleted\xca\xf8\xd8,\x16\x63lientconnectorserviceB\xcb\x02\xaa\x02\x42Google.Events.Protobuf.Cloud.BeyondCorp.ClientConnectorServices.V1\xca\x02\x39Google\\Events\\Cloud\\BeyondCorp\\ClientConnectorServices\\V1\xea\x02>Google::Events::Cloud::BeyondCorp::ClientConnectorServices::V1\xba\xf8\xd8,\nBeyondCorp\xc2\xf8\xd8,u\n\x16\x63lientconnectorservice\x12\x43The resource ID of the ClientConnectorService triggering the event.\x1a\x16\x63lientConnectorServiceb\x06proto3"

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
    ["google.events.cloud.beyondcorp.clientconnectorservices.v1.ClientConnectorServiceEventData", "google/events/cloud/beyondcorp/clientconnectorservices/v1/data.proto"],
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
      module BeyondCorp
        module ClientConnectorServices
          module V1
            ClientConnectorServiceCreatedEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.beyondcorp.clientconnectorservices.v1.ClientConnectorServiceCreatedEvent").msgclass
            ClientConnectorServiceUpdatedEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.beyondcorp.clientconnectorservices.v1.ClientConnectorServiceUpdatedEvent").msgclass
            ClientConnectorServiceDeletedEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.beyondcorp.clientconnectorservices.v1.ClientConnectorServiceDeletedEvent").msgclass
          end
        end
      end
    end
  end
end
