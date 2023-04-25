# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/events/firebase/auth/v1/events.proto

require 'google/protobuf'

require 'google/events/cloudevent_pb'
require 'google/events/firebase/auth/v1/data_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/events/firebase/auth/v1/events.proto", :syntax => :proto3) do
    add_message "google.events.firebase.auth.v1.UserCreatedEvent" do
      optional :data, :message, 1, "google.events.firebase.auth.v1.AuthEventData"
    end
    add_message "google.events.firebase.auth.v1.UserDeletedEvent" do
      optional :data, :message, 1, "google.events.firebase.auth.v1.AuthEventData"
    end
  end
end

module Google
  module Events
    module Firebase
      module Auth
        module V1
          UserCreatedEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.firebase.auth.v1.UserCreatedEvent").msgclass
          UserDeletedEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.firebase.auth.v1.UserDeletedEvent").msgclass
        end
      end
    end
  end
end
