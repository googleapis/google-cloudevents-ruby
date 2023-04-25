# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/events/cloud/beyondcorp/clientconnectorservices/v1/events.proto

require 'google/protobuf'

require 'google/events/cloud/beyondcorp/clientconnectorservices/v1/data_pb'
require 'google/events/cloudevent_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/events/cloud/beyondcorp/clientconnectorservices/v1/events.proto", :syntax => :proto3) do
    add_message "google.events.cloud.beyondcorp.clientconnectorservices.v1.ClientConnectorServiceCreatedEvent" do
      optional :data, :message, 1, "google.events.cloud.beyondcorp.clientconnectorservices.v1.ClientConnectorServiceEventData"
    end
    add_message "google.events.cloud.beyondcorp.clientconnectorservices.v1.ClientConnectorServiceUpdatedEvent" do
      optional :data, :message, 1, "google.events.cloud.beyondcorp.clientconnectorservices.v1.ClientConnectorServiceEventData"
    end
    add_message "google.events.cloud.beyondcorp.clientconnectorservices.v1.ClientConnectorServiceDeletedEvent" do
      optional :data, :message, 1, "google.events.cloud.beyondcorp.clientconnectorservices.v1.ClientConnectorServiceEventData"
    end
  end
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
