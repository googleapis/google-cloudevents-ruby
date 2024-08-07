# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/events/cloud/firestore/v1/events.proto

require 'google/protobuf'

require 'google/events/cloud/firestore/v1/data_pb'
require 'google/events/cloudevent_pb'


descriptor_data = "\n-google/events/cloud/firestore/v1/events.proto\x12 google.events.cloud.firestore.v1\x1a+google/events/cloud/firestore/v1/data.proto\x1a\x1egoogle/events/cloudevent.proto\"\xb2\x01\n\x14\x44ocumentCreatedEvent\x12\x41\n\x04\x64\x61ta\x18\x01 \x01(\x0b\x32\x33.google.events.cloud.firestore.v1.DocumentEventData:W\xb2\xf8\xd8,*google.cloud.firestore.document.v1.created\xca\xf8\xd8,\x08\x64\x61tabase\xca\xf8\xd8,\tnamespace\xca\xf8\xd8,\x08\x64ocument\"\xb2\x01\n\x14\x44ocumentUpdatedEvent\x12\x41\n\x04\x64\x61ta\x18\x01 \x01(\x0b\x32\x33.google.events.cloud.firestore.v1.DocumentEventData:W\xb2\xf8\xd8,*google.cloud.firestore.document.v1.updated\xca\xf8\xd8,\x08\x64\x61tabase\xca\xf8\xd8,\tnamespace\xca\xf8\xd8,\x08\x64ocument\"\xb2\x01\n\x14\x44ocumentDeletedEvent\x12\x41\n\x04\x64\x61ta\x18\x01 \x01(\x0b\x32\x33.google.events.cloud.firestore.v1.DocumentEventData:W\xb2\xf8\xd8,*google.cloud.firestore.document.v1.deleted\xca\xf8\xd8,\x08\x64\x61tabase\xca\xf8\xd8,\tnamespace\xca\xf8\xd8,\x08\x64ocument\"\xb2\x01\n\x14\x44ocumentWrittenEvent\x12\x41\n\x04\x64\x61ta\x18\x01 \x01(\x0b\x32\x33.google.events.cloud.firestore.v1.DocumentEventData:W\xb2\xf8\xd8,*google.cloud.firestore.document.v1.written\xca\xf8\xd8,\x08\x64\x61tabase\xca\xf8\xd8,\tnamespace\xca\xf8\xd8,\x08\x64ocument\"\xe9\x01\n#DocumentCreatedEventWithAuthContext\x12\x41\n\x04\x64\x61ta\x18\x01 \x01(\x0b\x32\x33.google.events.cloud.firestore.v1.DocumentEventData:\x7f\xb2\xf8\xd8,:google.cloud.firestore.document.v1.created.withAuthContext\xca\xf8\xd8,\x08\x64\x61tabase\xca\xf8\xd8,\tnamespace\xca\xf8\xd8,\x08\x64ocument\xca\xf8\xd8,\x08\x61uthtype\xca\xf8\xd8,\x06\x61uthid\"\xe9\x01\n#DocumentUpdatedEventWithAuthContext\x12\x41\n\x04\x64\x61ta\x18\x01 \x01(\x0b\x32\x33.google.events.cloud.firestore.v1.DocumentEventData:\x7f\xb2\xf8\xd8,:google.cloud.firestore.document.v1.updated.withAuthContext\xca\xf8\xd8,\x08\x64\x61tabase\xca\xf8\xd8,\tnamespace\xca\xf8\xd8,\x08\x64ocument\xca\xf8\xd8,\x08\x61uthtype\xca\xf8\xd8,\x06\x61uthid\"\xe9\x01\n#DocumentDeletedEventWithAuthContext\x12\x41\n\x04\x64\x61ta\x18\x01 \x01(\x0b\x32\x33.google.events.cloud.firestore.v1.DocumentEventData:\x7f\xb2\xf8\xd8,:google.cloud.firestore.document.v1.deleted.withAuthContext\xca\xf8\xd8,\x08\x64\x61tabase\xca\xf8\xd8,\tnamespace\xca\xf8\xd8,\x08\x64ocument\xca\xf8\xd8,\x08\x61uthtype\xca\xf8\xd8,\x06\x61uthid\"\xe9\x01\n#DocumentWrittenEventWithAuthContext\x12\x41\n\x04\x64\x61ta\x18\x01 \x01(\x0b\x32\x33.google.events.cloud.firestore.v1.DocumentEventData:\x7f\xb2\xf8\xd8,:google.cloud.firestore.document.v1.written.withAuthContext\xca\xf8\xd8,\x08\x64\x61tabase\xca\xf8\xd8,\tnamespace\xca\xf8\xd8,\x08\x64ocument\xca\xf8\xd8,\x08\x61uthtype\xca\xf8\xd8,\x06\x61uthidB\xb0\x03\xaa\x02)Google.Events.Protobuf.Cloud.Firestore.V1\xca\x02 Google\\Events\\Cloud\\Firestore\\V1\xea\x02$Google::Events::Cloud::Firestore::V1\xba\xf8\xd8,\x0f\x43loud Firestore\xc2\xf8\xd8,R\n\x08\x64\x61tabase\x12\x46The Firestore database name. The default database name is \"(default)\".\xc2\xf8\xd8,\x96\x01\n\tnamespace\x12\x88\x01The Firestore database namespace. Applicable to database instances running in Datastore mode only. The default namespace is \"(default)\".\xc2\xf8\xd8,.\n\x08\x64ocument\x12\"Pattern to match for the resource.b\x06proto3"

pool = Google::Protobuf::DescriptorPool.generated_pool
pool.add_serialized_file(descriptor_data)

module Google
  module Events
    module Cloud
      module Firestore
        module V1
          DocumentCreatedEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.firestore.v1.DocumentCreatedEvent").msgclass
          DocumentUpdatedEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.firestore.v1.DocumentUpdatedEvent").msgclass
          DocumentDeletedEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.firestore.v1.DocumentDeletedEvent").msgclass
          DocumentWrittenEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.firestore.v1.DocumentWrittenEvent").msgclass
          DocumentCreatedEventWithAuthContext = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.firestore.v1.DocumentCreatedEventWithAuthContext").msgclass
          DocumentUpdatedEventWithAuthContext = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.firestore.v1.DocumentUpdatedEventWithAuthContext").msgclass
          DocumentDeletedEventWithAuthContext = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.firestore.v1.DocumentDeletedEventWithAuthContext").msgclass
          DocumentWrittenEventWithAuthContext = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.firestore.v1.DocumentWrittenEventWithAuthContext").msgclass
        end
      end
    end
  end
end
