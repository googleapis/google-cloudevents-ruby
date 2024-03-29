# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/events/cloud/gkebackup/v1/events.proto

require 'google/protobuf'

require 'google/events/cloud/gkebackup/v1/data_pb'
require 'google/events/cloudevent_pb'


descriptor_data = "\n-google/events/cloud/gkebackup/v1/events.proto\x12 google.events.cloud.gkebackup.v1\x1a+google/events/cloud/gkebackup/v1/data.proto\x1a\x1egoogle/events/cloudevent.proto\"\x9f\x01\n\x16\x42\x61\x63kupPlanCreatedEvent\x12\x43\n\x04\x64\x61ta\x18\x01 \x01(\x0b\x32\x35.google.events.cloud.gkebackup.v1.BackupPlanEventData:@\xb2\xf8\xd8,,google.cloud.gkebackup.backupPlan.v1.created\xca\xf8\xd8,\nbackupplan\"\x9f\x01\n\x16\x42\x61\x63kupPlanUpdatedEvent\x12\x43\n\x04\x64\x61ta\x18\x01 \x01(\x0b\x32\x35.google.events.cloud.gkebackup.v1.BackupPlanEventData:@\xb2\xf8\xd8,,google.cloud.gkebackup.backupPlan.v1.updated\xca\xf8\xd8,\nbackupplan\"\x9f\x01\n\x16\x42\x61\x63kupPlanDeletedEvent\x12\x43\n\x04\x64\x61ta\x18\x01 \x01(\x0b\x32\x35.google.events.cloud.gkebackup.v1.BackupPlanEventData:@\xb2\xf8\xd8,,google.cloud.gkebackup.backupPlan.v1.deleted\xca\xf8\xd8,\nbackupplan\"\x9e\x01\n\x12\x42\x61\x63kupCreatedEvent\x12?\n\x04\x64\x61ta\x18\x01 \x01(\x0b\x32\x31.google.events.cloud.gkebackup.v1.BackupEventData:G\xb2\xf8\xd8,(google.cloud.gkebackup.backup.v1.created\xca\xf8\xd8,\nbackupplan\xca\xf8\xd8,\x06\x62\x61\x63kup\"\x9e\x01\n\x12\x42\x61\x63kupUpdatedEvent\x12?\n\x04\x64\x61ta\x18\x01 \x01(\x0b\x32\x31.google.events.cloud.gkebackup.v1.BackupEventData:G\xb2\xf8\xd8,(google.cloud.gkebackup.backup.v1.updated\xca\xf8\xd8,\nbackupplan\xca\xf8\xd8,\x06\x62\x61\x63kup\"\x9e\x01\n\x12\x42\x61\x63kupDeletedEvent\x12?\n\x04\x64\x61ta\x18\x01 \x01(\x0b\x32\x31.google.events.cloud.gkebackup.v1.BackupEventData:G\xb2\xf8\xd8,(google.cloud.gkebackup.backup.v1.deleted\xca\xf8\xd8,\nbackupplan\xca\xf8\xd8,\x06\x62\x61\x63kup\"\xa3\x01\n\x17RestorePlanCreatedEvent\x12\x44\n\x04\x64\x61ta\x18\x01 \x01(\x0b\x32\x36.google.events.cloud.gkebackup.v1.RestorePlanEventData:B\xb2\xf8\xd8,-google.cloud.gkebackup.restorePlan.v1.created\xca\xf8\xd8,\x0brestoreplan\"\xa3\x01\n\x17RestorePlanUpdatedEvent\x12\x44\n\x04\x64\x61ta\x18\x01 \x01(\x0b\x32\x36.google.events.cloud.gkebackup.v1.RestorePlanEventData:B\xb2\xf8\xd8,-google.cloud.gkebackup.restorePlan.v1.updated\xca\xf8\xd8,\x0brestoreplan\"\xa3\x01\n\x17RestorePlanDeletedEvent\x12\x44\n\x04\x64\x61ta\x18\x01 \x01(\x0b\x32\x36.google.events.cloud.gkebackup.v1.RestorePlanEventData:B\xb2\xf8\xd8,-google.cloud.gkebackup.restorePlan.v1.deleted\xca\xf8\xd8,\x0brestoreplan\"\xa3\x01\n\x13RestoreCreatedEvent\x12@\n\x04\x64\x61ta\x18\x01 \x01(\x0b\x32\x32.google.events.cloud.gkebackup.v1.RestoreEventData:J\xb2\xf8\xd8,)google.cloud.gkebackup.restore.v1.created\xca\xf8\xd8,\x0brestoreplan\xca\xf8\xd8,\x07restore\"\xa3\x01\n\x13RestoreUpdatedEvent\x12@\n\x04\x64\x61ta\x18\x01 \x01(\x0b\x32\x32.google.events.cloud.gkebackup.v1.RestoreEventData:J\xb2\xf8\xd8,)google.cloud.gkebackup.restore.v1.updated\xca\xf8\xd8,\x0brestoreplan\xca\xf8\xd8,\x07restore\"\xa3\x01\n\x13RestoreDeletedEvent\x12@\n\x04\x64\x61ta\x18\x01 \x01(\x0b\x32\x32.google.events.cloud.gkebackup.v1.RestoreEventData:J\xb2\xf8\xd8,)google.cloud.gkebackup.restore.v1.deleted\xca\xf8\xd8,\x0brestoreplan\xca\xf8\xd8,\x07restoreB\xf4\x02\xaa\x02)Google.Events.Protobuf.Cloud.GkeBackup.V1\xba\xf8\xd8,\x0e\x42\x61\x63kup for GKE\xc2\xf8\xd8,Q\n\nbackupplan\x12\x37The resource ID of the BackupPlan triggering the event.\x1a\nbackupPlan\xc2\xf8\xd8,=\n\x06\x62\x61\x63kup\x12\x33The resource ID of the Backup triggering the event.\xc2\xf8\xd8,T\n\x0brestoreplan\x12\x38The resource ID of the RestorePlan triggering the event.\x1a\x0brestorePlan\xc2\xf8\xd8,?\n\x07restore\x12\x34The resource ID of the Restore triggering the event.b\x06proto3"

pool = Google::Protobuf::DescriptorPool.generated_pool

begin
  pool.add_serialized_file(descriptor_data)
rescue TypeError
  # Compatibility code: will be removed in the next major version.
  require 'google/protobuf/descriptor_pb'
  parsed = Google::Protobuf::FileDescriptorProto.decode(descriptor_data)
  parsed.clear_dependency
  serialized = parsed.class.encode(parsed)
  file = pool.add_serialized_file(serialized)
  warn "Warning: Protobuf detected an import path issue while loading generated file #{__FILE__}"
  imports = [
    ["google.events.cloud.gkebackup.v1.BackupPlanEventData", "google/events/cloud/gkebackup/v1/data.proto"],
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
      module Gkebackup
        module V1
          BackupPlanCreatedEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.gkebackup.v1.BackupPlanCreatedEvent").msgclass
          BackupPlanUpdatedEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.gkebackup.v1.BackupPlanUpdatedEvent").msgclass
          BackupPlanDeletedEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.gkebackup.v1.BackupPlanDeletedEvent").msgclass
          BackupCreatedEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.gkebackup.v1.BackupCreatedEvent").msgclass
          BackupUpdatedEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.gkebackup.v1.BackupUpdatedEvent").msgclass
          BackupDeletedEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.gkebackup.v1.BackupDeletedEvent").msgclass
          RestorePlanCreatedEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.gkebackup.v1.RestorePlanCreatedEvent").msgclass
          RestorePlanUpdatedEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.gkebackup.v1.RestorePlanUpdatedEvent").msgclass
          RestorePlanDeletedEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.gkebackup.v1.RestorePlanDeletedEvent").msgclass
          RestoreCreatedEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.gkebackup.v1.RestoreCreatedEvent").msgclass
          RestoreUpdatedEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.gkebackup.v1.RestoreUpdatedEvent").msgclass
          RestoreDeletedEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.gkebackup.v1.RestoreDeletedEvent").msgclass
        end
      end
    end
  end
end
