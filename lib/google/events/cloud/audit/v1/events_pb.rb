# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/events/cloud/audit/v1/events.proto

require 'google/protobuf'

require 'google/events/cloud/audit/v1/data_pb'
require 'google/events/cloudevent_pb'


descriptor_data = "\n)google/events/cloud/audit/v1/events.proto\x12\x1cgoogle.events.cloud.audit.v1\x1a\'google/events/cloud/audit/v1/data.proto\x1a\x1egoogle/events/cloudevent.proto\"\xa8\x01\n\x14\x41uditLogWrittenEvent\x12\x38\n\x04\x64\x61ta\x18\x01 \x01(\x0b\x32*.google.events.cloud.audit.v1.LogEntryData:V\xb2\xf8\xd8,!google.cloud.audit.log.v1.written\xca\xf8\xd8,\x0bservicename\xca\xf8\xd8,\nmethodname\xca\xf8\xd8,\x0cresourcenameB\xb0\x03\xaa\x02%Google.Events.Protobuf.Cloud.Audit.V1\xca\x02\x1cGoogle\\Events\\Cloud\\Audit\\V1\xea\x02 Google::Events::Cloud::Audit::V1\xba\xf8\xd8,\x10\x43loud Audit Logs\xc2\xf8\xd8,^\n\x0bservicename\x12\x42The name of the service which triggered the Cloud Audit log entry.\x1a\x0bserviceName\xc2\xf8\xd8,\\\n\nmethodname\x12\x42The name of the method (RPC) triggering the Cloud Audit log entry.\x1a\nmethodName\xc2\xf8\xd8,h\n\x0cresourcename\x12JThe name of the resource that is the subject of the Cloud Audit log entry.\x1a\x0cresourceNameb\x06proto3"

pool = Google::Protobuf::DescriptorPool.generated_pool
pool.add_serialized_file(descriptor_data)

module Google
  module Events
    module Cloud
      module Audit
        module V1
          AuditLogWrittenEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.audit.v1.AuditLogWrittenEvent").msgclass
        end
      end
    end
  end
end
