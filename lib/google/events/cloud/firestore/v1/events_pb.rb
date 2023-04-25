# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/events/cloud/firestore/v1/events.proto

require 'google/protobuf'

require 'google/events/cloud/firestore/v1/data_pb'
require 'google/events/cloudevent_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/events/cloud/firestore/v1/events.proto", :syntax => :proto3) do
    add_message "google.events.cloud.firestore.v1.DocumentCreatedEvent" do
      optional :data, :message, 1, "google.events.cloud.firestore.v1.DocumentEventData"
    end
    add_message "google.events.cloud.firestore.v1.DocumentUpdatedEvent" do
      optional :data, :message, 1, "google.events.cloud.firestore.v1.DocumentEventData"
    end
    add_message "google.events.cloud.firestore.v1.DocumentDeletedEvent" do
      optional :data, :message, 1, "google.events.cloud.firestore.v1.DocumentEventData"
    end
    add_message "google.events.cloud.firestore.v1.DocumentWrittenEvent" do
      optional :data, :message, 1, "google.events.cloud.firestore.v1.DocumentEventData"
    end
  end
end

module Google
  module Events
    module Cloud
      module Firestore
        module V1
          DocumentCreatedEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.firestore.v1.DocumentCreatedEvent").msgclass
          DocumentUpdatedEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.firestore.v1.DocumentUpdatedEvent").msgclass
          DocumentDeletedEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.firestore.v1.DocumentDeletedEvent").msgclass
          DocumentWrittenEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.firestore.v1.DocumentWrittenEvent").msgclass
        end
      end
    end
  end
end
