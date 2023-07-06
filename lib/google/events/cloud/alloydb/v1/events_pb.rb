# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/events/cloud/alloydb/v1/events.proto

require 'google/protobuf'

require 'google/events/cloud/alloydb/v1/data_pb'
require 'google/events/cloudevent_pb'


descriptor_data = "\n+google/events/cloud/alloydb/v1/events.proto\x12\x1egoogle.events.cloud.alloydb.v1\x1a)google/events/cloud/alloydb/v1/data.proto\x1a\x1egoogle/events/cloudevent.proto\"\x8f\x01\n\x13\x43lusterCreatedEvent\x12>\n\x04\x64\x61ta\x18\x01 \x01(\x0b\x32\x30.google.events.cloud.alloydb.v1.ClusterEventData:8\xb2\xf8\xd8,\'google.cloud.alloydb.cluster.v1.created\xca\xf8\xd8,\x07\x63luster\"\x8f\x01\n\x13\x43lusterUpdatedEvent\x12>\n\x04\x64\x61ta\x18\x01 \x01(\x0b\x32\x30.google.events.cloud.alloydb.v1.ClusterEventData:8\xb2\xf8\xd8,\'google.cloud.alloydb.cluster.v1.updated\xca\xf8\xd8,\x07\x63luster\"\x8f\x01\n\x13\x43lusterDeletedEvent\x12>\n\x04\x64\x61ta\x18\x01 \x01(\x0b\x32\x30.google.events.cloud.alloydb.v1.ClusterEventData:8\xb2\xf8\xd8,\'google.cloud.alloydb.cluster.v1.deleted\xca\xf8\xd8,\x07\x63luster\"\x9f\x01\n\x14InstanceCreatedEvent\x12?\n\x04\x64\x61ta\x18\x01 \x01(\x0b\x32\x31.google.events.cloud.alloydb.v1.InstanceEventData:F\xb2\xf8\xd8,(google.cloud.alloydb.instance.v1.created\xca\xf8\xd8,\x07\x63luster\xca\xf8\xd8,\x08instance\"\x9f\x01\n\x14InstanceUpdatedEvent\x12?\n\x04\x64\x61ta\x18\x01 \x01(\x0b\x32\x31.google.events.cloud.alloydb.v1.InstanceEventData:F\xb2\xf8\xd8,(google.cloud.alloydb.instance.v1.updated\xca\xf8\xd8,\x07\x63luster\xca\xf8\xd8,\x08instance\"\x9f\x01\n\x14InstanceDeletedEvent\x12?\n\x04\x64\x61ta\x18\x01 \x01(\x0b\x32\x31.google.events.cloud.alloydb.v1.InstanceEventData:F\xb2\xf8\xd8,(google.cloud.alloydb.instance.v1.deleted\xca\xf8\xd8,\x07\x63luster\xca\xf8\xd8,\x08instance\"\x8b\x01\n\x12\x42\x61\x63kupCreatedEvent\x12=\n\x04\x64\x61ta\x18\x01 \x01(\x0b\x32/.google.events.cloud.alloydb.v1.BackupEventData:6\xb2\xf8\xd8,&google.cloud.alloydb.backup.v1.created\xca\xf8\xd8,\x06\x62\x61\x63kup\"\x8b\x01\n\x12\x42\x61\x63kupUpdatedEvent\x12=\n\x04\x64\x61ta\x18\x01 \x01(\x0b\x32/.google.events.cloud.alloydb.v1.BackupEventData:6\xb2\xf8\xd8,&google.cloud.alloydb.backup.v1.updated\xca\xf8\xd8,\x06\x62\x61\x63kup\"\x8b\x01\n\x12\x42\x61\x63kupDeletedEvent\x12=\n\x04\x64\x61ta\x18\x01 \x01(\x0b\x32/.google.events.cloud.alloydb.v1.BackupEventData:6\xb2\xf8\xd8,&google.cloud.alloydb.backup.v1.deleted\xca\xf8\xd8,\x06\x62\x61\x63kupB\xd7\x02\xaa\x02\'Google.Events.Protobuf.Cloud.AlloyDb.V1\xca\x02\x1eGoogle\\Events\\Cloud\\AlloyDb\\V1\xea\x02\"Google::Events::Cloud::AlloyDb::V1\xba\xf8\xd8,\x16\x41lloyDB for PostgreSQL\xc2\xf8\xd8,?\n\x07\x63luster\x12\x34The resource ID of the Cluster triggering the event.\xc2\xf8\xd8,A\n\x08instance\x12\x35The resource ID of the Instance triggering the event.\xc2\xf8\xd8,=\n\x06\x62\x61\x63kup\x12\x33The resource ID of the Backup triggering the event.b\x06proto3"

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
    ["google.events.cloud.alloydb.v1.ClusterEventData", "google/events/cloud/alloydb/v1/data.proto"],
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
      module AlloyDb
        module V1
          ClusterCreatedEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.alloydb.v1.ClusterCreatedEvent").msgclass
          ClusterUpdatedEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.alloydb.v1.ClusterUpdatedEvent").msgclass
          ClusterDeletedEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.alloydb.v1.ClusterDeletedEvent").msgclass
          InstanceCreatedEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.alloydb.v1.InstanceCreatedEvent").msgclass
          InstanceUpdatedEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.alloydb.v1.InstanceUpdatedEvent").msgclass
          InstanceDeletedEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.alloydb.v1.InstanceDeletedEvent").msgclass
          BackupCreatedEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.alloydb.v1.BackupCreatedEvent").msgclass
          BackupUpdatedEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.alloydb.v1.BackupUpdatedEvent").msgclass
          BackupDeletedEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.alloydb.v1.BackupDeletedEvent").msgclass
        end
      end
    end
  end
end
