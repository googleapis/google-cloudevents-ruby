# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/events/cloud/visionai/v1/data.proto

require 'google/protobuf'

require 'google/protobuf/duration_pb'
require 'google/protobuf/struct_pb'
require 'google/protobuf/timestamp_pb'


descriptor_data = "\n*google/events/cloud/visionai/v1/data.proto\x12\x1fgoogle.events.cloud.visionai.v1\x1a\x1egoogle/protobuf/duration.proto\x1a\x1cgoogle/protobuf/struct.proto\x1a\x1fgoogle/protobuf/timestamp.proto\"\xbf\x02\n\x10StreamAnnotation\x12I\n\x0b\x61\x63tive_zone\x18\x05 \x01(\x0b\x32\x32.google.events.cloud.visionai.v1.NormalizedPolygonH\x00\x12L\n\rcrossing_line\x18\x06 \x01(\x0b\x32\x33.google.events.cloud.visionai.v1.NormalizedPolylineH\x00\x12\n\n\x02id\x18\x01 \x01(\t\x12\x14\n\x0c\x64isplay_name\x18\x02 \x01(\t\x12\x15\n\rsource_stream\x18\x03 \x01(\t\x12\x43\n\x04type\x18\x04 \x01(\x0e\x32\x35.google.events.cloud.visionai.v1.StreamAnnotationTypeB\x14\n\x12\x61nnotation_payload\"c\n\x11NormalizedPolygon\x12N\n\x13normalized_vertices\x18\x01 \x03(\x0b\x32\x31.google.events.cloud.visionai.v1.NormalizedVertex\"d\n\x12NormalizedPolyline\x12N\n\x13normalized_vertices\x18\x01 \x03(\x0b\x32\x31.google.events.cloud.visionai.v1.NormalizedVertex\"(\n\x10NormalizedVertex\x12\t\n\x01x\x18\x01 \x01(\x02\x12\t\n\x01y\x18\x02 \x01(\x02\"\xc1\x04\n\x07\x43luster\x12\x0c\n\x04name\x18\x01 \x01(\t\x12/\n\x0b\x63reate_time\x18\x02 \x01(\x0b\x32\x1a.google.protobuf.Timestamp\x12/\n\x0bupdate_time\x18\x03 \x01(\x0b\x32\x1a.google.protobuf.Timestamp\x12\x44\n\x06labels\x18\x04 \x03(\x0b\x32\x34.google.events.cloud.visionai.v1.Cluster.LabelsEntry\x12N\n\x0b\x61nnotations\x18\x05 \x03(\x0b\x32\x39.google.events.cloud.visionai.v1.Cluster.AnnotationsEntry\x12\"\n\x1a\x64\x61taplane_service_endpoint\x18\x06 \x01(\t\x12=\n\x05state\x18\x07 \x01(\x0e\x32..google.events.cloud.visionai.v1.Cluster.State\x12\x12\n\npsc_target\x18\x08 \x01(\t\x1a-\n\x0bLabelsEntry\x12\x0b\n\x03key\x18\x01 \x01(\t\x12\r\n\x05value\x18\x02 \x01(\t:\x02\x38\x01\x1a\x32\n\x10\x41nnotationsEntry\x12\x0b\n\x03key\x18\x01 \x01(\t\x12\r\n\x05value\x18\x02 \x01(\t:\x02\x38\x01\"V\n\x05State\x12\x15\n\x11STATE_UNSPECIFIED\x10\x00\x12\x10\n\x0cPROVISIONING\x10\x01\x12\x0b\n\x07RUNNING\x10\x02\x12\x0c\n\x08STOPPING\x10\x03\x12\t\n\x05\x45RROR\x10\x04\"\x19\n\tGcsSource\x12\x0c\n\x04uris\x18\x01 \x03(\t\"M\n\x0e\x41ttributeValue\x12\x0b\n\x01i\x18\x01 \x01(\x03H\x00\x12\x0b\n\x01\x66\x18\x02 \x01(\x02H\x00\x12\x0b\n\x01\x62\x18\x03 \x01(\x08H\x00\x12\x0b\n\x01s\x18\x04 \x01(\x0cH\x00\x42\x07\n\x05value\"\xf7\x04\n\x12\x41nalyzerDefinition\x12\x10\n\x08\x61nalyzer\x18\x01 \x01(\t\x12\x10\n\x08operator\x18\x02 \x01(\t\x12O\n\x06inputs\x18\x03 \x03(\x0b\x32?.google.events.cloud.visionai.v1.AnalyzerDefinition.StreamInput\x12M\n\x05\x61ttrs\x18\x04 \x03(\x0b\x32>.google.events.cloud.visionai.v1.AnalyzerDefinition.AttrsEntry\x12W\n\rdebug_options\x18\x05 \x01(\x0b\x32@.google.events.cloud.visionai.v1.AnalyzerDefinition.DebugOptions\x1a\x1c\n\x0bStreamInput\x12\r\n\x05input\x18\x01 \x01(\t\x1a\xc6\x01\n\x0c\x44\x65\x62ugOptions\x12y\n\x15\x65nvironment_variables\x18\x01 \x03(\x0b\x32Z.google.events.cloud.visionai.v1.AnalyzerDefinition.DebugOptions.EnvironmentVariablesEntry\x1a;\n\x19\x45nvironmentVariablesEntry\x12\x0b\n\x03key\x18\x01 \x01(\t\x12\r\n\x05value\x18\x02 \x01(\t:\x02\x38\x01\x1a]\n\nAttrsEntry\x12\x0b\n\x03key\x18\x01 \x01(\t\x12>\n\x05value\x18\x02 \x01(\x0b\x32/.google.events.cloud.visionai.v1.AttributeValue:\x02\x38\x01\"\\\n\x12\x41nalysisDefinition\x12\x46\n\tanalyzers\x18\x01 \x03(\x0b\x32\x33.google.events.cloud.visionai.v1.AnalyzerDefinition\"\xc3\x01\n\tRunStatus\x12?\n\x05state\x18\x01 \x01(\x0e\x32\x30.google.events.cloud.visionai.v1.RunStatus.State\x12\x0e\n\x06reason\x18\x02 \x01(\t\"e\n\x05State\x12\x15\n\x11STATE_UNSPECIFIED\x10\x00\x12\x10\n\x0cINITIALIZING\x10\x01\x12\x0b\n\x07RUNNING\x10\x02\x12\r\n\tCOMPLETED\x10\x03\x12\n\n\x06\x46\x41ILED\x10\x04\x12\x0b\n\x07PENDING\x10\x05\"\xa0\x05\n\x08\x41nalysis\x12\x0c\n\x04name\x18\x01 \x01(\t\x12/\n\x0b\x63reate_time\x18\x02 \x01(\x0b\x32\x1a.google.protobuf.Timestamp\x12/\n\x0bupdate_time\x18\x03 \x01(\x0b\x32\x1a.google.protobuf.Timestamp\x12\x45\n\x06labels\x18\x04 \x03(\x0b\x32\x35.google.events.cloud.visionai.v1.Analysis.LabelsEntry\x12P\n\x13\x61nalysis_definition\x18\x05 \x01(\x0b\x32\x33.google.events.cloud.visionai.v1.AnalysisDefinition\x12\x61\n\x15input_streams_mapping\x18\x06 \x03(\x0b\x32\x42.google.events.cloud.visionai.v1.Analysis.InputStreamsMappingEntry\x12\x63\n\x16output_streams_mapping\x18\x07 \x03(\x0b\x32\x43.google.events.cloud.visionai.v1.Analysis.OutputStreamsMappingEntry\x12\x1b\n\x13\x64isable_event_watch\x18\x08 \x01(\x08\x1a-\n\x0bLabelsEntry\x12\x0b\n\x03key\x18\x01 \x01(\t\x12\r\n\x05value\x18\x02 \x01(\t:\x02\x38\x01\x1a:\n\x18InputStreamsMappingEntry\x12\x0b\n\x03key\x18\x01 \x01(\t\x12\r\n\x05value\x18\x02 \x01(\t:\x02\x38\x01\x1a;\n\x19OutputStreamsMappingEntry\x12\x0b\n\x03key\x18\x01 \x01(\t\x12\r\n\x05value\x18\x02 \x01(\t:\x02\x38\x01\"\xdd\x02\n\x07Process\x12\x0c\n\x04name\x18\x01 \x01(\t\x12/\n\x0b\x63reate_time\x18\x02 \x01(\x0b\x32\x1a.google.protobuf.Timestamp\x12/\n\x0bupdate_time\x18\x03 \x01(\x0b\x32\x1a.google.protobuf.Timestamp\x12\x10\n\x08\x61nalysis\x18\x04 \x01(\t\x12\x1b\n\x13\x61ttribute_overrides\x18\x05 \x03(\t\x12>\n\nrun_status\x18\x06 \x01(\x0b\x32*.google.events.cloud.visionai.v1.RunStatus\x12:\n\x08run_mode\x18\x07 \x01(\x0e\x32(.google.events.cloud.visionai.v1.RunMode\x12\x10\n\x08\x65vent_id\x18\x08 \x01(\t\x12\x10\n\x08\x62\x61tch_id\x18\t \x01(\t\x12\x13\n\x0bretry_count\x18\n \x01(\x05\"\x81\n\n\x0b\x41pplication\x12\x0c\n\x04name\x18\x01 \x01(\t\x12/\n\x0b\x63reate_time\x18\x02 \x01(\x0b\x32\x1a.google.protobuf.Timestamp\x12/\n\x0bupdate_time\x18\x03 \x01(\x0b\x32\x1a.google.protobuf.Timestamp\x12H\n\x06labels\x18\x04 \x03(\x0b\x32\x38.google.events.cloud.visionai.v1.Application.LabelsEntry\x12\x14\n\x0c\x64isplay_name\x18\x05 \x01(\t\x12\x13\n\x0b\x64\x65scription\x18\x06 \x01(\t\x12P\n\x13\x61pplication_configs\x18\x07 \x01(\x0b\x32\x33.google.events.cloud.visionai.v1.ApplicationConfigs\x12Y\n\x0cruntime_info\x18\x08 \x01(\x0b\x32\x43.google.events.cloud.visionai.v1.Application.ApplicationRuntimeInfo\x12\x41\n\x05state\x18\t \x01(\x0e\x32\x32.google.events.cloud.visionai.v1.Application.State\x12N\n\x0c\x62illing_mode\x18\x0c \x01(\x0e\x32\x38.google.events.cloud.visionai.v1.Application.BillingMode\x1a\xaf\x03\n\x16\x41pplicationRuntimeInfo\x12/\n\x0b\x64\x65ploy_time\x18\x01 \x01(\x0b\x32\x1a.google.protobuf.Timestamp\x12y\n\x17global_output_resources\x18\x03 \x03(\x0b\x32X.google.events.cloud.visionai.v1.Application.ApplicationRuntimeInfo.GlobalOutputResource\x12o\n\x11monitoring_config\x18\x04 \x01(\x0b\x32T.google.events.cloud.visionai.v1.Application.ApplicationRuntimeInfo.MonitoringConfig\x1aS\n\x14GlobalOutputResource\x12\x17\n\x0foutput_resource\x18\x01 \x01(\t\x12\x15\n\rproducer_node\x18\x02 \x01(\t\x12\x0b\n\x03key\x18\x03 \x01(\t\x1a#\n\x10MonitoringConfig\x12\x0f\n\x07\x65nabled\x18\x01 \x01(\x08\x1a-\n\x0bLabelsEntry\x12\x0b\n\x03key\x18\x01 \x01(\t\x12\r\n\x05value\x18\x02 \x01(\t:\x02\x38\x01\"\xa7\x01\n\x05State\x12\x15\n\x11STATE_UNSPECIFIED\x10\x00\x12\x0b\n\x07\x43REATED\x10\x01\x12\r\n\tDEPLOYING\x10\x02\x12\x0c\n\x08\x44\x45PLOYED\x10\x03\x12\x0f\n\x0bUNDEPLOYING\x10\x04\x12\x0b\n\x07\x44\x45LETED\x10\x05\x12\t\n\x05\x45RROR\x10\x06\x12\x0c\n\x08\x43REATING\x10\x07\x12\x0c\n\x08UPDATING\x10\x08\x12\x0c\n\x08\x44\x45LETING\x10\t\x12\n\n\x06\x46IXING\x10\n\"B\n\x0b\x42illingMode\x12\x1c\n\x18\x42ILLING_MODE_UNSPECIFIED\x10\x00\x12\x08\n\x04PAYG\x10\x01\x12\x0b\n\x07MONTHLY\x10\x02\"J\n\x12\x41pplicationConfigs\x12\x34\n\x05nodes\x18\x01 \x03(\x0b\x32%.google.events.cloud.visionai.v1.Node\"\xf0\x02\n\x04Node\x12.\n$output_all_output_channels_to_stream\x18\x06 \x01(\x08H\x00\x12\x0c\n\x04name\x18\x01 \x01(\t\x12\x14\n\x0c\x64isplay_name\x18\x02 \x01(\t\x12\x45\n\x0bnode_config\x18\x03 \x01(\x0b\x32\x30.google.events.cloud.visionai.v1.ProcessorConfig\x12\x11\n\tprocessor\x18\x04 \x01(\t\x12@\n\x07parents\x18\x05 \x03(\x0b\x32/.google.events.cloud.visionai.v1.Node.InputEdge\x1a`\n\tInputEdge\x12\x13\n\x0bparent_node\x18\x01 \x01(\t\x12\x1d\n\x15parent_output_channel\x18\x02 \x01(\t\x12\x1f\n\x17\x63onnected_input_channel\x18\x03 \x01(\tB\x16\n\x14stream_output_config\"\xed\x02\n\x05\x44raft\x12\x0c\n\x04name\x18\x01 \x01(\t\x12/\n\x0b\x63reate_time\x18\x02 \x01(\x0b\x32\x1a.google.protobuf.Timestamp\x12/\n\x0bupdate_time\x18\x07 \x01(\x0b\x32\x1a.google.protobuf.Timestamp\x12\x42\n\x06labels\x18\x03 \x03(\x0b\x32\x32.google.events.cloud.visionai.v1.Draft.LabelsEntry\x12\x14\n\x0c\x64isplay_name\x18\x04 \x01(\t\x12\x13\n\x0b\x64\x65scription\x18\x05 \x01(\t\x12V\n\x19\x64raft_application_configs\x18\x06 \x01(\x0b\x32\x33.google.events.cloud.visionai.v1.ApplicationConfigs\x1a-\n\x0bLabelsEntry\x12\x0b\n\x03key\x18\x01 \x01(\t\x12\r\n\x05value\x18\x02 \x01(\t:\x02\x38\x01\"\x87\x08\n\tProcessor\x12\x0c\n\x04name\x18\x01 \x01(\t\x12/\n\x0b\x63reate_time\x18\x02 \x01(\x0b\x32\x1a.google.protobuf.Timestamp\x12/\n\x0bupdate_time\x18\x03 \x01(\x0b\x32\x1a.google.protobuf.Timestamp\x12\x46\n\x06labels\x18\x04 \x03(\x0b\x32\x36.google.events.cloud.visionai.v1.Processor.LabelsEntry\x12\x14\n\x0c\x64isplay_name\x18\x05 \x01(\t\x12\x13\n\x0b\x64\x65scription\x18\n \x01(\t\x12P\n\x0eprocessor_type\x18\x06 \x01(\x0e\x32\x38.google.events.cloud.visionai.v1.Processor.ProcessorType\x12>\n\nmodel_type\x18\r \x01(\x0e\x32*.google.events.cloud.visionai.v1.ModelType\x12`\n\x1c\x63ustom_processor_source_info\x18\x07 \x01(\x0b\x32:.google.events.cloud.visionai.v1.CustomProcessorSourceInfo\x12H\n\x05state\x18\x08 \x01(\x0e\x32\x39.google.events.cloud.visionai.v1.Processor.ProcessorState\x12K\n\x11processor_io_spec\x18\x0b \x01(\x0b\x32\x30.google.events.cloud.visionai.v1.ProcessorIOSpec\x12\x1d\n\x15\x63onfiguration_typeurl\x18\x0e \x01(\t\x12Y\n\x1asupported_annotation_types\x18\x0f \x03(\x0e\x32\x35.google.events.cloud.visionai.v1.StreamAnnotationType\x12 \n\x18supports_post_processing\x18\x11 \x01(\x08\x1a-\n\x0bLabelsEntry\x12\x0b\n\x03key\x18\x01 \x01(\t\x12\r\n\x05value\x18\x02 \x01(\t:\x02\x38\x01\"Z\n\rProcessorType\x12\x1e\n\x1aPROCESSOR_TYPE_UNSPECIFIED\x10\x00\x12\x0e\n\nPRETRAINED\x10\x01\x12\n\n\x06\x43USTOM\x10\x02\x12\r\n\tCONNECTOR\x10\x03\"e\n\x0eProcessorState\x12\x1f\n\x1bPROCESSOR_STATE_UNSPECIFIED\x10\x00\x12\x0c\n\x08\x43REATING\x10\x01\x12\n\n\x06\x41\x43TIVE\x10\x02\x12\x0c\n\x08\x44\x45LETING\x10\x03\x12\n\n\x06\x46\x41ILED\x10\x04\"\x82\x08\n\x0fProcessorIOSpec\x12i\n\x19graph_input_channel_specs\x18\x03 \x03(\x0b\x32\x46.google.events.cloud.visionai.v1.ProcessorIOSpec.GraphInputChannelSpec\x12k\n\x1agraph_output_channel_specs\x18\x04 \x03(\x0b\x32G.google.events.cloud.visionai.v1.ProcessorIOSpec.GraphOutputChannelSpec\x12\x80\x01\n%instance_resource_input_binding_specs\x18\x05 \x03(\x0b\x32Q.google.events.cloud.visionai.v1.ProcessorIOSpec.InstanceResourceInputBindingSpec\x12\x82\x01\n&instance_resource_output_binding_specs\x18\x06 \x03(\x0b\x32R.google.events.cloud.visionai.v1.ProcessorIOSpec.InstanceResourceOutputBindingSpec\x1a\xb6\x01\n\x15GraphInputChannelSpec\x12\x0c\n\x04name\x18\x01 \x01(\t\x12<\n\tdata_type\x18\x02 \x01(\x0e\x32).google.events.cloud.visionai.v1.DataType\x12\x1f\n\x17\x61\x63\x63\x65pted_data_type_uris\x18\x05 \x03(\t\x12\x10\n\x08required\x18\x03 \x01(\x08\x12\x1e\n\x16max_connection_allowed\x18\x04 \x01(\x03\x1a{\n\x16GraphOutputChannelSpec\x12\x0c\n\x04name\x18\x01 \x01(\t\x12<\n\tdata_type\x18\x02 \x01(\x0e\x32).google.events.cloud.visionai.v1.DataType\x12\x15\n\rdata_type_uri\x18\x03 \x01(\t\x1ay\n InstanceResourceInputBindingSpec\x12\x19\n\x0f\x63onfig_type_uri\x18\x02 \x01(\tH\x00\x12\x1b\n\x11resource_type_uri\x18\x03 \x01(\tH\x00\x12\x0c\n\x04name\x18\x01 \x01(\tB\x0f\n\rresource_type\x1a^\n!InstanceResourceOutputBindingSpec\x12\x0c\n\x04name\x18\x01 \x01(\t\x12\x19\n\x11resource_type_uri\x18\x02 \x01(\t\x12\x10\n\x08\x65xplicit\x18\x03 \x01(\x08\"\xec\x05\n\x19\x43ustomProcessorSourceInfo\x12\x16\n\x0cvertex_model\x18\x02 \x01(\tH\x00\x12Z\n\x0bsource_type\x18\x01 \x01(\x0e\x32\x45.google.events.cloud.visionai.v1.CustomProcessorSourceInfo.SourceType\x12g\n\x0f\x61\x64\x64itional_info\x18\x04 \x03(\x0b\x32N.google.events.cloud.visionai.v1.CustomProcessorSourceInfo.AdditionalInfoEntry\x12\\\n\x0cmodel_schema\x18\x05 \x01(\x0b\x32\x46.google.events.cloud.visionai.v1.CustomProcessorSourceInfo.ModelSchema\x1a\xe2\x01\n\x0bModelSchema\x12\x44\n\x10instances_schema\x18\x01 \x01(\x0b\x32*.google.events.cloud.visionai.v1.GcsSource\x12\x45\n\x11parameters_schema\x18\x02 \x01(\x0b\x32*.google.events.cloud.visionai.v1.GcsSource\x12\x46\n\x12predictions_schema\x18\x03 \x01(\x0b\x32*.google.events.cloud.visionai.v1.GcsSource\x1a\x35\n\x13\x41\x64\x64itionalInfoEntry\x12\x0b\n\x03key\x18\x01 \x01(\t\x12\r\n\x05value\x18\x02 \x01(\t:\x02\x38\x01\"g\n\nSourceType\x12\x1b\n\x17SOURCE_TYPE_UNSPECIFIED\x10\x00\x12\x11\n\rVERTEX_AUTOML\x10\x01\x12\x11\n\rVERTEX_CUSTOM\x10\x02\x12\x16\n\x12PRODUCT_RECOGNIZER\x10\x03\x42\x0f\n\rartifact_path\"\xaf\t\n\x0fProcessorConfig\x12\\\n\x19video_stream_input_config\x18\t \x01(\x0b\x32\x37.google.events.cloud.visionai.v1.VideoStreamInputConfigH\x00\x12g\n\x1f\x61i_enabled_devices_input_config\x18\x14 \x01(\x0b\x32<.google.events.cloud.visionai.v1.AIEnabledDevicesInputConfigH\x00\x12W\n\x16media_warehouse_config\x18\n \x01(\x0b\x32\x35.google.events.cloud.visionai.v1.MediaWarehouseConfigH\x00\x12O\n\x12person_blur_config\x18\x0b \x01(\x0b\x32\x31.google.events.cloud.visionai.v1.PersonBlurConfigH\x00\x12W\n\x16occupancy_count_config\x18\x0c \x01(\x0b\x32\x35.google.events.cloud.visionai.v1.OccupancyCountConfigH\x00\x12h\n\x1fperson_vehicle_detection_config\x18\x0f \x01(\x0b\x32=.google.events.cloud.visionai.v1.PersonVehicleDetectionConfigH\x00\x12`\n\x1bvertex_automl_vision_config\x18\r \x01(\x0b\x32\x39.google.events.cloud.visionai.v1.VertexAutoMLVisionConfigH\x00\x12^\n\x1avertex_automl_video_config\x18\x0e \x01(\x0b\x32\x38.google.events.cloud.visionai.v1.VertexAutoMLVideoConfigH\x00\x12S\n\x14vertex_custom_config\x18\x11 \x01(\x0b\x32\x33.google.events.cloud.visionai.v1.VertexCustomConfigH\x00\x12h\n\x1fgeneral_object_detection_config\x18\x12 \x01(\x0b\x32=.google.events.cloud.visionai.v1.GeneralObjectDetectionConfigH\x00\x12K\n\x10\x62ig_query_config\x18\x13 \x01(\x0b\x32/.google.events.cloud.visionai.v1.BigQueryConfigH\x00\x12\x85\x01\n.personal_protective_equipment_detection_config\x18\x16 \x01(\x0b\x32K.google.events.cloud.visionai.v1.PersonalProtectiveEquipmentDetectionConfigH\x00\x42\x12\n\x10processor_config\"\xc2\x02\n\x14StreamWithAnnotation\x12\x0e\n\x06stream\x18\x01 \x01(\t\x12R\n\x17\x61pplication_annotations\x18\x02 \x03(\x0b\x32\x31.google.events.cloud.visionai.v1.StreamAnnotation\x12^\n\x10node_annotations\x18\x03 \x03(\x0b\x32\x44.google.events.cloud.visionai.v1.StreamWithAnnotation.NodeAnnotation\x1a\x66\n\x0eNodeAnnotation\x12\x0c\n\x04node\x18\x01 \x01(\t\x12\x46\n\x0b\x61nnotations\x18\x02 \x03(\x0b\x32\x31.google.events.cloud.visionai.v1.StreamAnnotation\"\x81\x01\n\x16VideoStreamInputConfig\x12\x0f\n\x07streams\x18\x01 \x03(\t\x12V\n\x17streams_with_annotation\x18\x02 \x03(\x0b\x32\x35.google.events.cloud.visionai.v1.StreamWithAnnotation\"\x1d\n\x1b\x41IEnabledDevicesInputConfig\"^\n\x14MediaWarehouseConfig\x12\x0e\n\x06\x63orpus\x18\x01 \x01(\t\x12\x0e\n\x06region\x18\x02 \x01(\t\x12&\n\x03ttl\x18\x03 \x01(\x0b\x32\x19.google.protobuf.Duration\"\xdc\x01\n\x10PersonBlurConfig\x12Z\n\x10person_blur_type\x18\x01 \x01(\x0e\x32@.google.events.cloud.visionai.v1.PersonBlurConfig.PersonBlurType\x12\x12\n\nfaces_only\x18\x02 \x01(\x08\"X\n\x0ePersonBlurType\x12 \n\x1cPERSON_BLUR_TYPE_UNSPECIFIED\x10\x00\x12\x13\n\x0f\x46ULL_OCCULUSION\x10\x01\x12\x0f\n\x0b\x42LUR_FILTER\x10\x02\"~\n\x14OccupancyCountConfig\x12\x1e\n\x16\x65nable_people_counting\x18\x01 \x01(\x08\x12\x1f\n\x17\x65nable_vehicle_counting\x18\x02 \x01(\x08\x12%\n\x1d\x65nable_dwelling_time_tracking\x18\x03 \x01(\x08\"_\n\x1cPersonVehicleDetectionConfig\x12\x1e\n\x16\x65nable_people_counting\x18\x01 \x01(\x08\x12\x1f\n\x17\x65nable_vehicle_counting\x18\x02 \x01(\x08\"\xa5\x01\n*PersonalProtectiveEquipmentDetectionConfig\x12&\n\x1e\x65nable_face_coverage_detection\x18\x01 \x01(\x08\x12&\n\x1e\x65nable_head_coverage_detection\x18\x02 \x01(\x08\x12\'\n\x1f\x65nable_hands_coverage_detection\x18\x03 \x01(\x08\"\x1e\n\x1cGeneralObjectDetectionConfig\"\xf3\x01\n\x0e\x42igQueryConfig\x12\r\n\x05table\x18\x01 \x01(\t\x12i\n\x16\x63loud_function_mapping\x18\x02 \x03(\x0b\x32I.google.events.cloud.visionai.v1.BigQueryConfig.CloudFunctionMappingEntry\x12*\n\"create_default_table_if_not_exists\x18\x03 \x01(\x08\x1a;\n\x19\x43loudFunctionMappingEntry\x12\x0b\n\x03key\x18\x01 \x01(\t\x12\r\n\x05value\x18\x02 \x01(\t:\x02\x38\x01\"Q\n\x18VertexAutoMLVisionConfig\x12\x1c\n\x14\x63onfidence_threshold\x18\x01 \x01(\x02\x12\x17\n\x0fmax_predictions\x18\x02 \x01(\x05\"\x89\x01\n\x17VertexAutoMLVideoConfig\x12\x1c\n\x14\x63onfidence_threshold\x18\x01 \x01(\x02\x12\x16\n\x0e\x62locked_labels\x18\x02 \x03(\t\x12\x17\n\x0fmax_predictions\x18\x03 \x01(\x05\x12\x1f\n\x17\x62ounding_box_size_limit\x18\x04 \x01(\x02\"\xcf\x01\n\x12VertexCustomConfig\x12\x1a\n\x12max_prediction_fps\x18\x01 \x01(\x05\x12P\n\x13\x64\x65\x64icated_resources\x18\x02 \x01(\x0b\x32\x33.google.events.cloud.visionai.v1.DedicatedResources\x12&\n\x1epost_processing_cloud_function\x18\x03 \x01(\t\x12#\n\x1b\x61ttach_application_metadata\x18\x04 \x01(\x08\"\x8a\x01\n\x0bMachineSpec\x12\x14\n\x0cmachine_type\x18\x01 \x01(\t\x12J\n\x10\x61\x63\x63\x65lerator_type\x18\x02 \x01(\x0e\x32\x30.google.events.cloud.visionai.v1.AcceleratorType\x12\x19\n\x11\x61\x63\x63\x65lerator_count\x18\x03 \x01(\x05\"<\n\x15\x41utoscalingMetricSpec\x12\x13\n\x0bmetric_name\x18\x01 \x01(\t\x12\x0e\n\x06target\x18\x02 \x01(\x05\"\xe8\x01\n\x12\x44\x65\x64icatedResources\x12\x42\n\x0cmachine_spec\x18\x01 \x01(\x0b\x32,.google.events.cloud.visionai.v1.MachineSpec\x12\x19\n\x11min_replica_count\x18\x02 \x01(\x05\x12\x19\n\x11max_replica_count\x18\x03 \x01(\x05\x12X\n\x18\x61utoscaling_metric_specs\x18\x04 \x03(\x0b\x32\x36.google.events.cloud.visionai.v1.AutoscalingMetricSpec\"\xc1\x03\n\x06Stream\x12\x0c\n\x04name\x18\x01 \x01(\t\x12/\n\x0b\x63reate_time\x18\x02 \x01(\x0b\x32\x1a.google.protobuf.Timestamp\x12/\n\x0bupdate_time\x18\x03 \x01(\x0b\x32\x1a.google.protobuf.Timestamp\x12\x43\n\x06labels\x18\x04 \x03(\x0b\x32\x33.google.events.cloud.visionai.v1.Stream.LabelsEntry\x12M\n\x0b\x61nnotations\x18\x05 \x03(\x0b\x32\x38.google.events.cloud.visionai.v1.Stream.AnnotationsEntry\x12\x14\n\x0c\x64isplay_name\x18\x06 \x01(\t\x12\x1b\n\x13\x65nable_hls_playback\x18\x07 \x01(\x08\x12\x1d\n\x15media_warehouse_asset\x18\x08 \x01(\t\x1a-\n\x0bLabelsEntry\x12\x0b\n\x03key\x18\x01 \x01(\t\x12\r\n\x05value\x18\x02 \x01(\t:\x02\x38\x01\x1a\x32\n\x10\x41nnotationsEntry\x12\x0b\n\x03key\x18\x01 \x01(\t\x12\r\n\x05value\x18\x02 \x01(\t:\x02\x38\x01\"\x9d\x04\n\x05\x45vent\x12\x0c\n\x04name\x18\x01 \x01(\t\x12/\n\x0b\x63reate_time\x18\x02 \x01(\x0b\x32\x1a.google.protobuf.Timestamp\x12/\n\x0bupdate_time\x18\x03 \x01(\x0b\x32\x1a.google.protobuf.Timestamp\x12\x42\n\x06labels\x18\x04 \x03(\x0b\x32\x32.google.events.cloud.visionai.v1.Event.LabelsEntry\x12L\n\x0b\x61nnotations\x18\x05 \x03(\x0b\x32\x37.google.events.cloud.visionai.v1.Event.AnnotationsEntry\x12\x45\n\x0f\x61lignment_clock\x18\x06 \x01(\x0e\x32,.google.events.cloud.visionai.v1.Event.Clock\x12/\n\x0cgrace_period\x18\x07 \x01(\x0b\x32\x19.google.protobuf.Duration\x1a-\n\x0bLabelsEntry\x12\x0b\n\x03key\x18\x01 \x01(\t\x12\r\n\x05value\x18\x02 \x01(\t:\x02\x38\x01\x1a\x32\n\x10\x41nnotationsEntry\x12\x0b\n\x03key\x18\x01 \x01(\t\x12\r\n\x05value\x18\x02 \x01(\t:\x02\x38\x01\"7\n\x05\x43lock\x12\x15\n\x11\x43LOCK_UNSPECIFIED\x10\x00\x12\x0b\n\x07\x43\x41PTURE\x10\x01\x12\n\n\x06INGEST\x10\x02\"\x8e\x03\n\x06Series\x12\x0c\n\x04name\x18\x01 \x01(\t\x12/\n\x0b\x63reate_time\x18\x02 \x01(\x0b\x32\x1a.google.protobuf.Timestamp\x12/\n\x0bupdate_time\x18\x03 \x01(\x0b\x32\x1a.google.protobuf.Timestamp\x12\x43\n\x06labels\x18\x04 \x03(\x0b\x32\x33.google.events.cloud.visionai.v1.Series.LabelsEntry\x12M\n\x0b\x61nnotations\x18\x05 \x03(\x0b\x32\x38.google.events.cloud.visionai.v1.Series.AnnotationsEntry\x12\x0e\n\x06stream\x18\x06 \x01(\t\x12\r\n\x05\x65vent\x18\x07 \x01(\t\x1a-\n\x0bLabelsEntry\x12\x0b\n\x03key\x18\x01 \x01(\t\x12\r\n\x05value\x18\x02 \x01(\t:\x02\x38\x01\x1a\x32\n\x10\x41nnotationsEntry\x12\x0b\n\x03key\x18\x01 \x01(\t\x12\r\n\x05value\x18\x02 \x01(\t:\x02\x38\x01\"\\\n\x0fSeriesEventData\x12=\n\x07payload\x18\x01 \x01(\x0b\x32\'.google.events.cloud.visionai.v1.SeriesH\x00\x88\x01\x01\x42\n\n\x08_payload\"Z\n\x0e\x44raftEventData\x12<\n\x07payload\x18\x01 \x01(\x0b\x32&.google.events.cloud.visionai.v1.DraftH\x00\x88\x01\x01\x42\n\n\x08_payload\"b\n\x12ProcessorEventData\x12@\n\x07payload\x18\x01 \x01(\x0b\x32*.google.events.cloud.visionai.v1.ProcessorH\x00\x88\x01\x01\x42\n\n\x08_payload\"`\n\x11\x41nalysisEventData\x12?\n\x07payload\x18\x01 \x01(\x0b\x32).google.events.cloud.visionai.v1.AnalysisH\x00\x88\x01\x01\x42\n\n\x08_payload\"^\n\x10\x43lusterEventData\x12>\n\x07payload\x18\x01 \x01(\x0b\x32(.google.events.cloud.visionai.v1.ClusterH\x00\x88\x01\x01\x42\n\n\x08_payload\"Z\n\x0e\x45ventEventData\x12<\n\x07payload\x18\x01 \x01(\x0b\x32&.google.events.cloud.visionai.v1.EventH\x00\x88\x01\x01\x42\n\n\x08_payload\"^\n\x10ProcessEventData\x12>\n\x07payload\x18\x01 \x01(\x0b\x32(.google.events.cloud.visionai.v1.ProcessH\x00\x88\x01\x01\x42\n\n\x08_payload\"\\\n\x0fStreamEventData\x12=\n\x07payload\x18\x01 \x01(\x0b\x32\'.google.events.cloud.visionai.v1.StreamH\x00\x88\x01\x01\x42\n\n\x08_payload\"f\n\x14\x41pplicationEventData\x12\x42\n\x07payload\x18\x01 \x01(\x0b\x32,.google.events.cloud.visionai.v1.ApplicationH\x00\x88\x01\x01\x42\n\n\x08_payload*\x90\x01\n\x14StreamAnnotationType\x12&\n\"STREAM_ANNOTATION_TYPE_UNSPECIFIED\x10\x00\x12&\n\"STREAM_ANNOTATION_TYPE_ACTIVE_ZONE\x10\x01\x12(\n$STREAM_ANNOTATION_TYPE_CROSSING_LINE\x10\x02*=\n\x07RunMode\x12\x18\n\x14RUN_MODE_UNSPECIFIED\x10\x00\x12\x08\n\x04LIVE\x10\x01\x12\x0e\n\nSUBMISSION\x10\x02*\xe6\x01\n\tModelType\x12\x1a\n\x16MODEL_TYPE_UNSPECIFIED\x10\x00\x12\x18\n\x14IMAGE_CLASSIFICATION\x10\x01\x12\x14\n\x10OBJECT_DETECTION\x10\x02\x12\x18\n\x14VIDEO_CLASSIFICATION\x10\x03\x12\x19\n\x15VIDEO_OBJECT_TRACKING\x10\x04\x12\x1c\n\x18VIDEO_ACTION_RECOGNITION\x10\x05\x12\x16\n\x12OCCUPANCY_COUNTING\x10\x06\x12\x0f\n\x0bPERSON_BLUR\x10\x07\x12\x11\n\rVERTEX_CUSTOM\x10\x08*\xd0\x01\n\x0f\x41\x63\x63\x65leratorType\x12 \n\x1c\x41\x43\x43\x45LERATOR_TYPE_UNSPECIFIED\x10\x00\x12\x14\n\x10NVIDIA_TESLA_K80\x10\x01\x12\x15\n\x11NVIDIA_TESLA_P100\x10\x02\x12\x15\n\x11NVIDIA_TESLA_V100\x10\x03\x12\x13\n\x0fNVIDIA_TESLA_P4\x10\x04\x12\x13\n\x0fNVIDIA_TESLA_T4\x10\x05\x12\x15\n\x11NVIDIA_TESLA_A100\x10\x08\x12\n\n\x06TPU_V2\x10\x06\x12\n\n\x06TPU_V3\x10\x07*F\n\x08\x44\x61taType\x12\x19\n\x15\x44\x41TA_TYPE_UNSPECIFIED\x10\x00\x12\t\n\x05VIDEO\x10\x01\x12\t\n\x05IMAGE\x10\x03\x12\t\n\x05PROTO\x10\x02\x42s\xaa\x02(Google.Events.Protobuf.Cloud.VisionAI.V1\xca\x02\x1fGoogle\\Events\\Cloud\\VisionAI\\V1\xea\x02#Google::Events::Cloud::VisionAI::V1b\x06proto3"

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
    ["google.protobuf.Timestamp", "google/protobuf/timestamp.proto"],
    ["google.protobuf.Duration", "google/protobuf/duration.proto"],
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
      module VisionAI
        module V1
          StreamAnnotation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.StreamAnnotation").msgclass
          NormalizedPolygon = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.NormalizedPolygon").msgclass
          NormalizedPolyline = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.NormalizedPolyline").msgclass
          NormalizedVertex = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.NormalizedVertex").msgclass
          Cluster = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.Cluster").msgclass
          Cluster::State = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.Cluster.State").enummodule
          GcsSource = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.GcsSource").msgclass
          AttributeValue = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.AttributeValue").msgclass
          AnalyzerDefinition = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.AnalyzerDefinition").msgclass
          AnalyzerDefinition::StreamInput = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.AnalyzerDefinition.StreamInput").msgclass
          AnalyzerDefinition::DebugOptions = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.AnalyzerDefinition.DebugOptions").msgclass
          AnalysisDefinition = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.AnalysisDefinition").msgclass
          RunStatus = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.RunStatus").msgclass
          RunStatus::State = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.RunStatus.State").enummodule
          Analysis = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.Analysis").msgclass
          Process = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.Process").msgclass
          Application = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.Application").msgclass
          Application::ApplicationRuntimeInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.Application.ApplicationRuntimeInfo").msgclass
          Application::ApplicationRuntimeInfo::GlobalOutputResource = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.Application.ApplicationRuntimeInfo.GlobalOutputResource").msgclass
          Application::ApplicationRuntimeInfo::MonitoringConfig = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.Application.ApplicationRuntimeInfo.MonitoringConfig").msgclass
          Application::State = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.Application.State").enummodule
          Application::BillingMode = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.Application.BillingMode").enummodule
          ApplicationConfigs = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.ApplicationConfigs").msgclass
          Node = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.Node").msgclass
          Node::InputEdge = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.Node.InputEdge").msgclass
          Draft = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.Draft").msgclass
          Processor = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.Processor").msgclass
          Processor::ProcessorType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.Processor.ProcessorType").enummodule
          Processor::ProcessorState = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.Processor.ProcessorState").enummodule
          ProcessorIOSpec = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.ProcessorIOSpec").msgclass
          ProcessorIOSpec::GraphInputChannelSpec = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.ProcessorIOSpec.GraphInputChannelSpec").msgclass
          ProcessorIOSpec::GraphOutputChannelSpec = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.ProcessorIOSpec.GraphOutputChannelSpec").msgclass
          ProcessorIOSpec::InstanceResourceInputBindingSpec = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.ProcessorIOSpec.InstanceResourceInputBindingSpec").msgclass
          ProcessorIOSpec::InstanceResourceOutputBindingSpec = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.ProcessorIOSpec.InstanceResourceOutputBindingSpec").msgclass
          CustomProcessorSourceInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.CustomProcessorSourceInfo").msgclass
          CustomProcessorSourceInfo::ModelSchema = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.CustomProcessorSourceInfo.ModelSchema").msgclass
          CustomProcessorSourceInfo::SourceType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.CustomProcessorSourceInfo.SourceType").enummodule
          ProcessorConfig = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.ProcessorConfig").msgclass
          StreamWithAnnotation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.StreamWithAnnotation").msgclass
          StreamWithAnnotation::NodeAnnotation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.StreamWithAnnotation.NodeAnnotation").msgclass
          VideoStreamInputConfig = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.VideoStreamInputConfig").msgclass
          AIEnabledDevicesInputConfig = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.AIEnabledDevicesInputConfig").msgclass
          MediaWarehouseConfig = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.MediaWarehouseConfig").msgclass
          PersonBlurConfig = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.PersonBlurConfig").msgclass
          PersonBlurConfig::PersonBlurType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.PersonBlurConfig.PersonBlurType").enummodule
          OccupancyCountConfig = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.OccupancyCountConfig").msgclass
          PersonVehicleDetectionConfig = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.PersonVehicleDetectionConfig").msgclass
          PersonalProtectiveEquipmentDetectionConfig = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.PersonalProtectiveEquipmentDetectionConfig").msgclass
          GeneralObjectDetectionConfig = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.GeneralObjectDetectionConfig").msgclass
          BigQueryConfig = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.BigQueryConfig").msgclass
          VertexAutoMLVisionConfig = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.VertexAutoMLVisionConfig").msgclass
          VertexAutoMLVideoConfig = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.VertexAutoMLVideoConfig").msgclass
          VertexCustomConfig = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.VertexCustomConfig").msgclass
          MachineSpec = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.MachineSpec").msgclass
          AutoscalingMetricSpec = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.AutoscalingMetricSpec").msgclass
          DedicatedResources = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.DedicatedResources").msgclass
          Stream = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.Stream").msgclass
          Event = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.Event").msgclass
          Event::Clock = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.Event.Clock").enummodule
          Series = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.Series").msgclass
          SeriesEventData = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.SeriesEventData").msgclass
          DraftEventData = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.DraftEventData").msgclass
          ProcessorEventData = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.ProcessorEventData").msgclass
          AnalysisEventData = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.AnalysisEventData").msgclass
          ClusterEventData = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.ClusterEventData").msgclass
          EventEventData = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.EventEventData").msgclass
          ProcessEventData = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.ProcessEventData").msgclass
          StreamEventData = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.StreamEventData").msgclass
          ApplicationEventData = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.ApplicationEventData").msgclass
          StreamAnnotationType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.StreamAnnotationType").enummodule
          RunMode = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.RunMode").enummodule
          ModelType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.ModelType").enummodule
          AcceleratorType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.AcceleratorType").enummodule
          DataType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.events.cloud.visionai.v1.DataType").enummodule
        end
      end
    end
  end
end
