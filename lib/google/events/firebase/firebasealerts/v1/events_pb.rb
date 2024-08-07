# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/events/firebase/firebasealerts/v1/events.proto

require 'google/protobuf'

require 'google/events/cloudevent_pb'
require 'google/events/firebase/firebasealerts/v1/data_pb'


descriptor_data = "\n5google/events/firebase/firebasealerts/v1/events.proto\x12(google.events.firebase.firebasealerts.v1\x1a\x1egoogle/events/cloudevent.proto\x1a\x33google/events/firebase/firebasealerts/v1/data.proto\"\xa9\x01\n\x13\x41lertPublishedEvent\x12\x41\n\x04\x64\x61ta\x18\x01 \x01(\x0b\x32\x33.google.events.firebase.firebasealerts.v1.AlertData:O\xb2\xf8\xd8,2google.firebase.firebasealerts.alerts.v1.published\xca\xf8\xd8,\talerttype\xca\xf8\xd8,\x05\x61ppidB\x92\x03\xaa\x02\x31Google.Events.Protobuf.Firebase.FirebaseAlerts.V1\xca\x02(Google\\Events\\Firebase\\FirebaseAlerts\\V1\xea\x02,Google::Events::Firebase::FirebaseAlerts::V1\xba\xf8\xd8,\x0f\x46irebase Alerts\xc2\xf8\xd8,B\n\talerttype\x12*The type of the alerts that got triggered.\x1a\talertType\xc2\xf8\xd8,\xa3\x01\n\x05\x61ppid\x12\x92\x01The Firebase App ID that\xe2\x80\x99s associated with the alert. This is optional, and only present when the alert is targeting at a specific Firebase App.\x1a\x05\x61ppIdb\x06proto3"

pool = Google::Protobuf::DescriptorPool.generated_pool
pool.add_serialized_file(descriptor_data)

module Google
  module Events
    module Firebase
      module FirebaseAlerts
        module V1
          AlertPublishedEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.firebase.firebasealerts.v1.AlertPublishedEvent").msgclass
        end
      end
    end
  end
end
