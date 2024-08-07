# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/events/cloud/datafusion/v1/data.proto

require 'google/protobuf'

require 'google/protobuf/timestamp_pb'


descriptor_data = "\n,google/events/cloud/datafusion/v1/data.proto\x12!google.events.cloud.datafusion.v1\x1a\x1fgoogle/protobuf/timestamp.proto\"7\n\rNetworkConfig\x12\x0f\n\x07network\x18\x01 \x01(\t\x12\x15\n\rip_allocation\x18\x02 \x01(\t\"\xe4\x01\n\x07Version\x12\x16\n\x0eversion_number\x18\x01 \x01(\t\x12\x17\n\x0f\x64\x65\x66\x61ult_version\x18\x02 \x01(\x08\x12\x1a\n\x12\x61vailable_features\x18\x03 \x03(\t\x12=\n\x04type\x18\x04 \x01(\x0e\x32/.google.events.cloud.datafusion.v1.Version.Type\"M\n\x04Type\x12\x14\n\x10TYPE_UNSPECIFIED\x10\x00\x12\x10\n\x0cTYPE_PREVIEW\x10\x01\x12\x1d\n\x19TYPE_GENERAL_AVAILABILITY\x10\x02\"\xd5\x02\n\x0b\x41\x63\x63\x65lerator\x12X\n\x10\x61\x63\x63\x65lerator_type\x18\x01 \x01(\x0e\x32>.google.events.cloud.datafusion.v1.Accelerator.AcceleratorType\x12\x43\n\x05state\x18\x02 \x01(\x0e\x32\x34.google.events.cloud.datafusion.v1.Accelerator.State\"_\n\x0f\x41\x63\x63\x65leratorType\x12 \n\x1c\x41\x43\x43\x45LERATOR_TYPE_UNSPECIFIED\x10\x00\x12\x07\n\x03\x43\x44\x43\x10\x01\x12\x0e\n\nHEALTHCARE\x10\x02\x12\x11\n\rCCAI_INSIGHTS\x10\x03\"F\n\x05State\x12\x15\n\x11STATE_UNSPECIFIED\x10\x00\x12\x0b\n\x07\x45NABLED\x10\x01\x12\x0c\n\x08\x44ISABLED\x10\x02\x12\x0b\n\x07UNKNOWN\x10\x03\"(\n\x0f\x43ryptoKeyConfig\x12\x15\n\rkey_reference\x18\x01 \x01(\t\"\xb5\r\n\x08Instance\x12\x0c\n\x04name\x18\x01 \x01(\t\x12\x13\n\x0b\x64\x65scription\x18\x02 \x01(\t\x12>\n\x04type\x18\x03 \x01(\x0e\x32\x30.google.events.cloud.datafusion.v1.Instance.Type\x12\"\n\x1a\x65nable_stackdriver_logging\x18\x04 \x01(\x08\x12%\n\x1d\x65nable_stackdriver_monitoring\x18\x05 \x01(\x08\x12\x18\n\x10private_instance\x18\x06 \x01(\x08\x12H\n\x0enetwork_config\x18\x07 \x01(\x0b\x32\x30.google.events.cloud.datafusion.v1.NetworkConfig\x12G\n\x06labels\x18\x08 \x03(\x0b\x32\x37.google.events.cloud.datafusion.v1.Instance.LabelsEntry\x12I\n\x07options\x18\t \x03(\x0b\x32\x38.google.events.cloud.datafusion.v1.Instance.OptionsEntry\x12/\n\x0b\x63reate_time\x18\n \x01(\x0b\x32\x1a.google.protobuf.Timestamp\x12/\n\x0bupdate_time\x18\x0b \x01(\x0b\x32\x1a.google.protobuf.Timestamp\x12@\n\x05state\x18\x0c \x01(\x0e\x32\x31.google.events.cloud.datafusion.v1.Instance.State\x12\x15\n\rstate_message\x18\r \x01(\t\x12\x18\n\x10service_endpoint\x18\x0e \x01(\t\x12\x0c\n\x04zone\x18\x0f \x01(\t\x12\x0f\n\x07version\x18\x10 \x01(\t\x12\x17\n\x0fservice_account\x18\x11 \x01(\t\x12\x14\n\x0c\x64isplay_name\x18\x12 \x01(\t\x12\x45\n\x11\x61vailable_version\x18\x13 \x03(\x0b\x32*.google.events.cloud.datafusion.v1.Version\x12\x14\n\x0c\x61pi_endpoint\x18\x14 \x01(\t\x12\x12\n\ngcs_bucket\x18\x15 \x01(\t\x12\x44\n\x0c\x61\x63\x63\x65lerators\x18\x16 \x03(\x0b\x32..google.events.cloud.datafusion.v1.Accelerator\x12\x1a\n\x12p4_service_account\x18\x17 \x01(\t\x12\x19\n\x11tenant_project_id\x18\x18 \x01(\t\x12 \n\x18\x64\x61taproc_service_account\x18\x19 \x01(\t\x12\x13\n\x0b\x65nable_rbac\x18\x1b \x01(\x08\x12M\n\x11\x63rypto_key_config\x18\x1c \x01(\x0b\x32\x32.google.events.cloud.datafusion.v1.CryptoKeyConfig\x12S\n\x0f\x64isabled_reason\x18\x1d \x03(\x0e\x32:.google.events.cloud.datafusion.v1.Instance.DisabledReason\x12S\n\x14\x65vent_publish_config\x18\x1e \x01(\x0b\x32\x35.google.events.cloud.datafusion.v1.EventPublishConfig\x12\x1e\n\x16\x65nable_zone_separation\x18\x1f \x01(\x08\x1a-\n\x0bLabelsEntry\x12\x0b\n\x03key\x18\x01 \x01(\t\x12\r\n\x05value\x18\x02 \x01(\t:\x02\x38\x01\x1a.\n\x0cOptionsEntry\x12\x0b\n\x03key\x18\x01 \x01(\t\x12\r\n\x05value\x18\x02 \x01(\t:\x02\x38\x01\"F\n\x04Type\x12\x14\n\x10TYPE_UNSPECIFIED\x10\x00\x12\t\n\x05\x42\x41SIC\x10\x01\x12\x0e\n\nENTERPRISE\x10\x02\x12\r\n\tDEVELOPER\x10\x03\"\xb4\x01\n\x05State\x12\x15\n\x11STATE_UNSPECIFIED\x10\x00\x12\x0c\n\x08\x43REATING\x10\x01\x12\n\n\x06\x41\x43TIVE\x10\x02\x12\n\n\x06\x46\x41ILED\x10\x03\x12\x0c\n\x08\x44\x45LETING\x10\x04\x12\r\n\tUPGRADING\x10\x05\x12\x0e\n\nRESTARTING\x10\x06\x12\x0c\n\x08UPDATING\x10\x07\x12\x11\n\rAUTO_UPDATING\x10\x08\x12\x12\n\x0e\x41UTO_UPGRADING\x10\t\x12\x0c\n\x08\x44ISABLED\x10\n\"D\n\x0e\x44isabledReason\x12\x1f\n\x1b\x44ISABLED_REASON_UNSPECIFIED\x10\x00\x12\x11\n\rKMS_KEY_ISSUE\x10\x01\"4\n\x12\x45ventPublishConfig\x12\x0f\n\x07\x65nabled\x18\x01 \x01(\x08\x12\r\n\x05topic\x18\x02 \x01(\t\"o\n\nDnsPeering\x12\x0c\n\x04name\x18\x01 \x01(\t\x12\x0e\n\x06\x64omain\x18\x02 \x01(\t\x12\x13\n\x0b\x64\x65scription\x18\x03 \x01(\t\x12\x16\n\x0etarget_project\x18\x04 \x01(\t\x12\x16\n\x0etarget_network\x18\x05 \x01(\t\"b\n\x11InstanceEventData\x12\x41\n\x07payload\x18\x01 \x01(\x0b\x32+.google.events.cloud.datafusion.v1.InstanceH\x00\x88\x01\x01\x42\n\n\x08_payload\"f\n\x13\x44nsPeeringEventData\x12\x43\n\x07payload\x18\x01 \x01(\x0b\x32-.google.events.cloud.datafusion.v1.DnsPeeringH\x00\x88\x01\x01\x42\n\n\x08_payloadBy\xaa\x02*Google.Events.Protobuf.Cloud.DataFusion.V1\xca\x02!Google\\Events\\Cloud\\DataFusion\\V1\xea\x02%Google::Events::Cloud::DataFusion::V1b\x06proto3"

pool = Google::Protobuf::DescriptorPool.generated_pool
pool.add_serialized_file(descriptor_data)

module Google
  module Events
    module Cloud
      module DataFusion
        module V1
          NetworkConfig = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.datafusion.v1.NetworkConfig").msgclass
          Version = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.datafusion.v1.Version").msgclass
          Version::Type = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.datafusion.v1.Version.Type").enummodule
          Accelerator = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.datafusion.v1.Accelerator").msgclass
          Accelerator::AcceleratorType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.datafusion.v1.Accelerator.AcceleratorType").enummodule
          Accelerator::State = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.datafusion.v1.Accelerator.State").enummodule
          CryptoKeyConfig = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.datafusion.v1.CryptoKeyConfig").msgclass
          Instance = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.datafusion.v1.Instance").msgclass
          Instance::Type = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.datafusion.v1.Instance.Type").enummodule
          Instance::State = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.datafusion.v1.Instance.State").enummodule
          Instance::DisabledReason = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.datafusion.v1.Instance.DisabledReason").enummodule
          EventPublishConfig = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.datafusion.v1.EventPublishConfig").msgclass
          DnsPeering = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.datafusion.v1.DnsPeering").msgclass
          InstanceEventData = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.datafusion.v1.InstanceEventData").msgclass
          DnsPeeringEventData = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.datafusion.v1.DnsPeeringEventData").msgclass
        end
      end
    end
  end
end
