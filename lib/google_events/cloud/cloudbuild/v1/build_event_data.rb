# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'json'
require 'dry-types'
require 'dry-struct'

module Types
  include Dry::Types.module

  Int                       = Strict::Int
  Bool                      = Strict::Bool
  Hash                      = Strict::Hash
  String                    = Strict::String
  LogStreamingOptionEnum    = Strict::String.enum("STREAM_DEFAULT", "STREAM_OFF", "STREAM_ON")
  LoggingEnum               = Strict::String.enum("GCS_ONLY", "LEGACY", "LOGGING_UNSPECIFIED")
  MachineTypeEnum           = Strict::String.enum("N1_HIGHCPU_32", "N1_HIGHCPU_8", "UNSPECIFIED")
  RequestedVerifyOptionEnum = Strict::String.enum("NOT_VERIFIED", "VERIFIED")
  SubstitutionOptionEnum    = Strict::String.enum("ALLOW_LOOSE", "MUST_MATCH")
  TypeEnum                  = Strict::String.enum("MD5", "NONE", "SHA256")
  StatusEnum                = Strict::String.enum("CANCELLED", "EXPIRED", "FAILURE", "INTERNAL_ERROR", "QUEUED", "STATUS_UNKNOWN", "SUCCESS", "TIMEOUT", "WORKING")
end

# Stores timing information for pushing all artifact objects.
#
# Start and end times for a build execution phase.
class ObjectsTiming < Dry::Struct

  # End of time span.
  attribute :end_time, Types::String.optional

  # Start of time span.
  attribute :start_time, Types::String.optional
end

# A list of objects to be uploaded to Cloud Storage upon successful
# completion of all build steps.
#
# Files in the workspace matching specified paths globs will be uploaded to
# the specified Cloud Storage location using the builder service account's
# credentials.
#
# The location and generation of the uploaded objects will be stored in the
# Build resource's results field.
#
# If any objects fail to be pushed, the build is marked FAILURE.
class Objects < Dry::Struct

  # Cloud Storage bucket and optional object path, in the form
  # "gs://bucket/path/to/somewhere/". (see [Bucket Name
  # Requirements](https://cloud.google.com/storage/docs/bucket-naming#requirements)).
  #
  # Files in the workspace matching any path pattern will be uploaded to
  # Cloud Storage with this location as a prefix.
  attribute :location, Types::String.optional

  # Path globs used to match files in the build's workspace.
  attribute :paths, Types.Array(Types::String).optional

  # Stores timing information for pushing all artifact objects.
  attribute :timing, ObjectsTiming.optional
end

# Artifacts produced by the build that should be uploaded upon
# successful completion of all build steps.
class Artifacts < Dry::Struct

  # A list of images to be pushed upon the successful completion of all build
  # steps.
  #
  # The images will be pushed using the builder service account's credentials.
  #
  # The digests of the pushed images will be stored in the Build resource's
  # results field.
  #
  # If any of the images fail to be pushed, the build is marked FAILURE.
  attribute :images, Types.Array(Types::String).optional

  # A list of objects to be uploaded to Cloud Storage upon successful
  # completion of all build steps.
  #
  # Files in the workspace matching specified paths globs will be uploaded to
  # the specified Cloud Storage location using the builder service account's
  # credentials.
  #
  # The location and generation of the uploaded objects will be stored in the
  # Build resource's results field.
  #
  # If any objects fail to be pushed, the build is marked FAILURE.
  attribute :objects, Objects.optional
end

class DiskSizeGB < Dry::Struct
  attribute :integer, Types::Int.optional
  attribute :string,  Types::String.optional
end

module LogStreamingOptionEnum
  StreamDefault = "STREAM_DEFAULT"
  StreamOff     = "STREAM_OFF"
  StreamOn      = "STREAM_ON"
end

# Option to define build log streaming behavior to Google Cloud
# Storage.
class LogStreamingOption < Dry::Struct
  attribute :enum,    Types::LogStreamingOptionEnum.optional
  attribute :integer, Types::Int.optional
end

module LoggingEnum
  GcsOnly            = "GCS_ONLY"
  Legacy             = "LEGACY"
  LoggingUnspecified = "LOGGING_UNSPECIFIED"
end

# Option to specify the logging mode, which determines where the logs are
# stored.
class Logging < Dry::Struct
  attribute :enum,    Types::LoggingEnum.optional
  attribute :integer, Types::Int.optional
end

module MachineTypeEnum
  N1Highcpu32 = "N1_HIGHCPU_32"
  N1Highcpu8  = "N1_HIGHCPU_8"
  Unspecified = "UNSPECIFIED"
end

# Compute Engine machine type on which to run the build.
class MachineType < Dry::Struct
  attribute :enum,    Types::MachineTypeEnum.optional
  attribute :integer, Types::Int.optional
end

module RequestedVerifyOptionEnum
  NotVerified = "NOT_VERIFIED"
  Verified    = "VERIFIED"
end

# Requested verifiability options.
class RequestedVerifyOption < Dry::Struct
  attribute :enum,    Types::RequestedVerifyOptionEnum.optional
  attribute :integer, Types::Int.optional
end

module SubstitutionOptionEnum
  AllowLoose = "ALLOW_LOOSE"
  MustMatch  = "MUST_MATCH"
end

# Option to specify behavior when there is an error in the substitution
# checks.
class SubstitutionOption < Dry::Struct
  attribute :enum,    Types::SubstitutionOptionEnum.optional
  attribute :integer, Types::Int.optional
end

# Volume describes a Docker container volume which is mounted into build steps
# in order to persist files across build step execution.
class Volume < Dry::Struct

  # Name of the volume to mount.
  #
  # Volume names must be unique per build step and must be valid names for
  # Docker volumes. Each named volume must be used by at least two build steps.
  attribute :volume_name, Types::String.optional

  # Path at which to mount the volume.
  #
  # Paths must be absolute and cannot conflict with other volume paths on the
  # same build step or with certain reserved volume paths.
  attribute :path, Types::String.optional
end

# Special options for this build.
class Options < Dry::Struct

  # Requested disk size for the VM that runs the build. Note that this is *NOT*
  # "disk free"; some of the space will be used by the operating system and
  # build utilities. Also note that this is the minimum disk size that will be
  # allocated for the build -- the build may run with a larger disk than
  # requested. At present, the maximum disk size is 1000GB; builds that request
  # more than the maximum are rejected with an error.
  attribute :disk_size_gb, Types.Instance(DiskSizeGB).optional

  # A list of global environment variable definitions that will exist for all
  # build steps in this build. If a variable is defined in both globally and in
  # a build step, the variable will use the build step value.
  #
  # The elements are of the form "KEY=VALUE" for the environment variable "KEY"
  # being given the value "VALUE".
  attribute :env, Types.Array(Types::String).optional

  # Option to specify the logging mode, which determines where the logs are
  # stored.
  attribute :logging, Types.Instance(Logging).optional

  # Option to define build log streaming behavior to Google Cloud
  # Storage.
  attribute :log_streaming_option, Types.Instance(LogStreamingOption).optional

  # Compute Engine machine type on which to run the build.
  attribute :machine_type, Types.Instance(MachineType).optional

  # Requested verifiability options.
  attribute :requested_verify_option, Types.Instance(RequestedVerifyOption).optional

  # A list of global environment variables, which are encrypted using a Cloud
  # Key Management Service crypto key. These values must be specified in the
  # build's `Secret`. These variables will be available to all build steps
  # in this build.
  attribute :secret_env, Types.Array(Types::String).optional

  # Requested hash for SourceProvenance.
  attribute :source_provenance_hash, Types.Array(Types.Instance(DiskSizeGB)).optional

  # Option to specify behavior when there is an error in the substitution
  # checks.
  attribute :substitution_option, Types.Instance(SubstitutionOption).optional

  # Global list of volumes to mount for ALL build steps
  #
  # Each volume is created as an empty volume prior to starting the build
  # process. Upon completion of the build, volumes and their contents are
  # discarded. Global volume names and paths cannot conflict with the volumes
  # defined a build step.
  #
  # Using a global volume in a build with only one step is not valid as
  # it is indicative of a build request with an incorrect configuration.
  attribute :volumes, Types.Array(Volume).optional

  # Option to specify a `WorkerPool` for the build.
  # Format: projects/{project}/locations/{location}/workerPools/{workerPool}
  attribute :worker_pool, Types::String.optional
end

# TTL in queue for this build. If provided and the build is enqueued longer
# than this value, the build will expire and the build status will be
# `EXPIRED`.
#
# The TTL starts ticking from create_time.
class QueueTTL < Dry::Struct

  # Signed fractions of a second at nanosecond resolution of the span
  # of time. Durations less than one second are represented with a 0
  # `seconds` field and a positive or negative `nanos` field. For durations
  # of one second or more, a non-zero value for the `nanos` field must be
  # of the same sign as the `seconds` field. Must be from -999,999,999
  # to +999,999,999 inclusive.
  attribute :nanos, Types::Int.optional

  # Signed seconds of the span of time. Must be from -315,576,000,000
  # to +315,576,000,000 inclusive. Note: these bounds are computed from:
  # 60 sec/min * 60 min/hr * 24 hr/day * 365.25 days/year * 10000 years
  attribute :seconds, Types.Instance(DiskSizeGB).optional
end

# Time to push all non-container artifacts.
#
# Stores timing information for pushing all artifact objects.
#
# Start and end times for a build execution phase.
class ArtifactTiming < Dry::Struct

  # End of time span.
  attribute :end_time, Types::String.optional

  # Start of time span.
  attribute :start_time, Types::String.optional
end

# Stores timing information for pushing the specified image.
#
# Stores timing information for pushing all artifact objects.
#
# Start and end times for a build execution phase.
class PushTiming < Dry::Struct

  # End of time span.
  attribute :end_time, Types::String.optional

  # Start of time span.
  attribute :start_time, Types::String.optional
end

# An image built by the pipeline.
class Image < Dry::Struct

  # Docker Registry 2.0 digest.
  attribute :digest, Types::String.optional

  # Name used to push the container image to Google Container Registry, as
  # presented to `docker push`.
  attribute :image_name, Types::String.optional

  # Stores timing information for pushing the specified image.
  attribute :push_timing, PushTiming.optional
end

# Results of the build.
class Results < Dry::Struct

  # Path to the artifact manifest. Only populated when artifacts are uploaded.
  attribute :artifact_manifest, Types::String.optional

  # Time to push all non-container artifacts.
  attribute :artifact_timing, ArtifactTiming.optional

  # List of build step digests, in the order corresponding to build step
  # indices.
  attribute :build_step_images, Types.Array(Types::String).optional

  # List of build step outputs, produced by builder images, in the order
  # corresponding to build step indices.
  #
  # [Cloud Builders](https://cloud.google.com/cloud-build/docs/cloud-builders)
  # can produce this output by writing to `$BUILDER_OUTPUT/output`.
  # Only the first 4KB of data is stored.
  attribute :build_step_outputs, Types.Array(Types::String).optional

  # Container images that were built as a part of the build.
  attribute :images, Types.Array(Image).optional

  # Number of artifacts uploaded. Only populated when artifacts are uploaded.
  attribute :num_artifacts, Types.Instance(DiskSizeGB).optional
end

# Pairs a set of secret environment variables containing encrypted
# values with the Cloud KMS key to use to decrypt the value.
class Secret < Dry::Struct

  # Cloud KMS key name to use to decrypt these envs.
  attribute :kms_key_name, Types::String.optional

  # Map of environment variable name to its encrypted value.
  #
  # Secret environment variables must be unique across all of a build's
  # secrets, and must be used by at least one build step. Values can be at most
  # 64 KB in size. There can be at most 100 secret values across all of a
  # build's secrets.
  attribute :secret_env, Types::Hash.meta(of: Types::String).optional
end

# If provided, get the source from this location in a Cloud Source
# Repository.
#
# Location of the source in a Google Cloud Source Repository.
class RepoSourceClass < Dry::Struct

  # Regex matching branches to build.
  #
  # The syntax of the regular expressions accepted is the syntax accepted by
  # RE2 and described at https://github.com/google/re2/wiki/Syntax
  attribute :branch_name, Types::String.optional

  # Explicit commit SHA to build.
  attribute :commit_sha, Types::String.optional

  # Directory, relative to the source root, in which to run the build.
  #
  # This must be a relative path. If a step's `dir` is specified and is an
  # absolute path, this value is ignored for that step's execution.
  attribute :dir, Types::String.optional

  # Only trigger a build if the revision regex does NOT match the revision
  # regex.
  attribute :invert_regex, Types::Bool.optional

  # ID of the project that owns the Cloud Source Repository.
  attribute :project_id, Types::String.optional

  # Name of the Cloud Source Repository.
  attribute :repo_name, Types::String.optional

  # Substitutions to use in a triggered build.
  # Should only be used with RunBuildTrigger
  attribute :substitutions, Types::Hash.meta(of: Types::String).optional

  # Regex matching tags to build.
  #
  # The syntax of the regular expressions accepted is the syntax accepted by
  # RE2 and described at https://github.com/google/re2/wiki/Syntax
  attribute :tag_name, Types::String.optional
end

# If provided, get the source from this location in Google Cloud Storage.
#
# Location of the source in an archive file in Google Cloud Storage.
class StorageSourceClass < Dry::Struct

  # Google Cloud Storage bucket containing the source (see
  # [Bucket Name
  # Requirements](https://cloud.google.com/storage/docs/bucket-naming#requirements)).
  attribute :bucket, Types::String.optional

  # Google Cloud Storage generation for the object. If the generation is
  # omitted, the latest generation will be used.
  attribute :generation, Types.Instance(DiskSizeGB).optional

  # Google Cloud Storage object containing the source.
  attribute :object, Types::String.optional
end

# The location of the source files to build.
class Source < Dry::Struct

  # If provided, get the source from this location in a Cloud Source
  # Repository.
  attribute :repo_source, RepoSourceClass.optional

  # If provided, get the source from this location in Google Cloud Storage.
  attribute :storage_source, StorageSourceClass.optional
end

module TypeEnum
  Md5    = "MD5"
  None   = "NONE"
  Sha256 = "SHA256"
end

# The type of hash that was performed.
class Type < Dry::Struct
  attribute :enum,    Types::TypeEnum.optional
  attribute :integer, Types::Int.optional
end

# Container message for hash values.
class FileHashElement < Dry::Struct

  # The type of hash that was performed.
  attribute :file_hash_type, Types.Instance(Type).optional

  # The hash value.
  attribute :value, Types::String.optional
end

class FileHashValue < Dry::Struct

  # Collection of file hashes.
  attribute :file_hash, Types.Array(FileHashElement).optional
end

# A copy of the build's `source.repo_source`, if exists, with any
# revisions resolved.
#
# If provided, get the source from this location in a Cloud Source
# Repository.
#
# Location of the source in a Google Cloud Source Repository.
class ResolvedRepoSourceClass < Dry::Struct

  # Regex matching branches to build.
  #
  # The syntax of the regular expressions accepted is the syntax accepted by
  # RE2 and described at https://github.com/google/re2/wiki/Syntax
  attribute :branch_name, Types::String.optional

  # Explicit commit SHA to build.
  attribute :commit_sha, Types::String.optional

  # Directory, relative to the source root, in which to run the build.
  #
  # This must be a relative path. If a step's `dir` is specified and is an
  # absolute path, this value is ignored for that step's execution.
  attribute :dir, Types::String.optional

  # Only trigger a build if the revision regex does NOT match the revision
  # regex.
  attribute :invert_regex, Types::Bool.optional

  # ID of the project that owns the Cloud Source Repository.
  attribute :project_id, Types::String.optional

  # Name of the Cloud Source Repository.
  attribute :repo_name, Types::String.optional

  # Substitutions to use in a triggered build.
  # Should only be used with RunBuildTrigger
  attribute :substitutions, Types::Hash.meta(of: Types::String).optional

  # Regex matching tags to build.
  #
  # The syntax of the regular expressions accepted is the syntax accepted by
  # RE2 and described at https://github.com/google/re2/wiki/Syntax
  attribute :tag_name, Types::String.optional
end

# A copy of the build's `source.storage_source`, if exists, with any
# generations resolved.
#
# If provided, get the source from this location in Google Cloud Storage.
#
# Location of the source in an archive file in Google Cloud Storage.
class ResolvedStorageSourceClass < Dry::Struct

  # Google Cloud Storage bucket containing the source (see
  # [Bucket Name
  # Requirements](https://cloud.google.com/storage/docs/bucket-naming#requirements)).
  attribute :bucket, Types::String.optional

  # Google Cloud Storage generation for the object. If the generation is
  # omitted, the latest generation will be used.
  attribute :generation, Types.Instance(DiskSizeGB).optional

  # Google Cloud Storage object containing the source.
  attribute :object, Types::String.optional
end

# A permanent fixed identifier for source.
class SourceProvenance < Dry::Struct

  # Hash(es) of the build source, which can be used to verify that
  # the original source integrity was maintained in the build. Note that
  # `FileHashes` will only be populated if `BuildOptions` has requested a
  # `SourceProvenanceHash`.
  #
  # The keys to this map are file paths used as build source and the values
  # contain the hash values for those files.
  #
  # If the build source came in a single package such as a gzipped tarfile
  # (`.tar.gz`), the `FileHash` will be for the single path to that file.
  attribute :file_hashes, Types::Hash.meta(of: FileHashValue).optional

  # A copy of the build's `source.repo_source`, if exists, with any
  # revisions resolved.
  attribute :resolved_repo_source, ResolvedRepoSourceClass.optional

  # A copy of the build's `source.storage_source`, if exists, with any
  # generations resolved.
  attribute :resolved_storage_source, ResolvedStorageSourceClass.optional
end

module StatusEnum
  Cancelled     = "CANCELLED"
  Expired       = "EXPIRED"
  Failure       = "FAILURE"
  InternalError = "INTERNAL_ERROR"
  Queued        = "QUEUED"
  StatusUnknown = "STATUS_UNKNOWN"
  Success       = "SUCCESS"
  Timeout       = "TIMEOUT"
  Working       = "WORKING"
end

# Status of the build.
class Status < Dry::Struct
  attribute :enum,    Types::StatusEnum.optional
  attribute :integer, Types::Int.optional
end

# Stores timing information for pulling this build step's
# builder image only.
#
# Stores timing information for pushing all artifact objects.
#
# Start and end times for a build execution phase.
class PullTiming < Dry::Struct

  # End of time span.
  attribute :end_time, Types::String.optional

  # Start of time span.
  attribute :start_time, Types::String.optional
end

# Time limit for executing this build step. If not defined, the step has no
# time limit and will be allowed to continue to run until either it completes
# or the build itself times out.
class StepTimeout < Dry::Struct

  # Signed fractions of a second at nanosecond resolution of the span
  # of time. Durations less than one second are represented with a 0
  # `seconds` field and a positive or negative `nanos` field. For durations
  # of one second or more, a non-zero value for the `nanos` field must be
  # of the same sign as the `seconds` field. Must be from -999,999,999
  # to +999,999,999 inclusive.
  attribute :nanos, Types::Int.optional

  # Signed seconds of the span of time. Must be from -315,576,000,000
  # to +315,576,000,000 inclusive. Note: these bounds are computed from:
  # 60 sec/min * 60 min/hr * 24 hr/day * 365.25 days/year * 10000 years
  attribute :seconds, Types.Instance(DiskSizeGB).optional
end

# Stores timing information for executing this build step.
#
# Stores timing information for pushing all artifact objects.
#
# Start and end times for a build execution phase.
class StepTiming < Dry::Struct

  # End of time span.
  attribute :end_time, Types::String.optional

  # Start of time span.
  attribute :start_time, Types::String.optional
end

# A step in the build pipeline.
class Step < Dry::Struct

  # A list of arguments that will be presented to the step when it is started.
  #
  # If the image used to run the step's container has an entrypoint, the `args`
  # are used as arguments to that entrypoint. If the image does not define
  # an entrypoint, the first element in args is used as the entrypoint,
  # and the remainder will be used as arguments.
  attribute :args, Types.Array(Types::String).optional

  # Working directory to use when running this step's container.
  #
  # If this value is a relative path, it is relative to the build's working
  # directory. If this value is absolute, it may be outside the build's working
  # directory, in which case the contents of the path may not be persisted
  # across build step executions, unless a `volume` for that path is specified.
  #
  # If the build specifies a `RepoSource` with `dir` and a step with a `dir`,
  # which specifies an absolute path, the `RepoSource` `dir` is ignored for
  # the step's execution.
  attribute :dir, Types::String.optional

  # Entrypoint to be used instead of the build step image's default entrypoint.
  # If unset, the image's default entrypoint is used.
  attribute :entrypoint, Types::String.optional

  # A list of environment variable definitions to be used when running a step.
  #
  # The elements are of the form "KEY=VALUE" for the environment variable "KEY"
  # being given the value "VALUE".
  attribute :env, Types.Array(Types::String).optional

  # Unique identifier for this build step, used in `wait_for` to
  # reference this build step as a dependency.
  attribute :id, Types::String.optional

  # The name of the container image that will run this particular
  # build step.
  #
  # If the image is available in the host's Docker daemon's cache, it
  # will be run directly. If not, the host will attempt to pull the image
  # first, using the builder service account's credentials if necessary.
  #
  # The Docker daemon's cache will already have the latest versions of all of
  # the officially supported build steps
  #
  # ([https://github.com/GoogleCloudPlatform/cloud-builders](https://github.com/GoogleCloudPlatform/cloud-builders)).
  # The Docker daemon will also have cached many of the layers for some popular
  # images, like "ubuntu", "debian", but they will be refreshed at the time you
  # attempt to use them.
  #
  # If you built an image in a previous build step, it will be stored in the
  # host's Docker daemon's cache and is available to use as the name for a
  # later build step.
  attribute :step_name, Types::String.optional

  # Stores timing information for pulling this build step's
  # builder image only.
  attribute :pull_timing, PullTiming.optional

  # A list of environment variables which are encrypted using a Cloud Key
  # Management Service crypto key. These values must be specified in the
  # build's `Secret`.
  attribute :secret_env, Types.Array(Types::String).optional

  # Status of the build step. At this time, build step status is
  # only updated on build completion; step status is not updated in real-time
  # as the build progresses.
  attribute :status, Types.Instance(DiskSizeGB).optional

  # Time limit for executing this build step. If not defined, the step has no
  # time limit and will be allowed to continue to run until either it completes
  # or the build itself times out.
  attribute :timeout, StepTimeout.optional

  # Stores timing information for executing this build step.
  attribute :timing, StepTiming.optional

  # List of volumes to mount into the build step.
  #
  # Each volume is created as an empty volume prior to execution of the
  # build step. Upon completion of the build, volumes and their contents are
  # discarded.
  #
  # Using a named volume in only one step is not valid as it is indicative
  # of a build request with an incorrect configuration.
  attribute :volumes, Types.Array(Volume).optional

  # The ID(s) of the step(s) that this build step depends on.
  # This build step will not start until all the build steps in `wait_for`
  # have completed successfully. If `wait_for` is empty, this build step will
  # start when all previous build steps in the `Build.Steps` list have
  # completed successfully.
  attribute :wait_for, Types.Array(Types::String).optional
end

# Amount of time that this build should be allowed to run, to second
# granularity. If this amount of time elapses, work on the build will cease
# and the build status will be `TIMEOUT`.
class BuildEventDataTimeout < Dry::Struct

  # Signed fractions of a second at nanosecond resolution of the span
  # of time. Durations less than one second are represented with a 0
  # `seconds` field and a positive or negative `nanos` field. For durations
  # of one second or more, a non-zero value for the `nanos` field must be
  # of the same sign as the `seconds` field. Must be from -999,999,999
  # to +999,999,999 inclusive.
  attribute :nanos, Types::Int.optional

  # Signed seconds of the span of time. Must be from -315,576,000,000
  # to +315,576,000,000 inclusive. Note: these bounds are computed from:
  # 60 sec/min * 60 min/hr * 24 hr/day * 365.25 days/year * 10000 years
  attribute :seconds, Types.Instance(DiskSizeGB).optional
end

# Stores timing information for pushing all artifact objects.
#
# Start and end times for a build execution phase.
class TimeSpan < Dry::Struct

  # End of time span.
  attribute :end_time, Types::String.optional

  # Start of time span.
  attribute :start_time, Types::String.optional
end

# Build event data
# Common build format for Google Cloud Platform API operations.
# Copied from
#
# https://github.com/googleapis/googleapis/blob/master/google/devtools/cloudbuild/v1/cloudbuild.proto.
class BuildEventData < Dry::Struct

  # Artifacts produced by the build that should be uploaded upon
  # successful completion of all build steps.
  attribute :artifacts, Artifacts.optional

  # The ID of the `BuildTrigger` that triggered this build, if it
  # was triggered automatically.
  attribute :build_trigger_id, Types::String.optional

  # Time at which the request to create the build was received.
  attribute :create_time, Types::String.optional

  # Time at which execution of the build was finished.
  #
  # The difference between finish_time and start_time is the duration of the
  # build's execution.
  attribute :finish_time, Types::String.optional

  # Unique identifier of the build.
  attribute :id, Types::String.optional

  # A list of images to be pushed upon the successful completion of all build
  # steps.
  #
  # The images are pushed using the builder service account's credentials.
  #
  # The digests of the pushed images will be stored in the `Build` resource's
  # results field.
  #
  # If any of the images fail to be pushed, the build status is marked
  # `FAILURE`.
  attribute :images, Types.Array(Types::String).optional

  # Google Cloud Storage bucket where logs should be written (see
  # [Bucket Name
  # Requirements](https://cloud.google.com/storage/docs/bucket-naming#requirements)).
  # Logs file names will be of the format `${logs_bucket}/log-${build_id}.txt`.
  attribute :logs_bucket, Types::String.optional

  # URL to logs for this build in Google Cloud Console.
  attribute :log_url, Types::String.optional

  # Special options for this build.
  attribute :build_event_data_options, Options.optional

  # ID of the project.
  attribute :project_id, Types::String.optional

  # TTL in queue for this build. If provided and the build is enqueued longer
  # than this value, the build will expire and the build status will be
  # `EXPIRED`.
  #
  # The TTL starts ticking from create_time.
  attribute :queue_ttl, QueueTTL.optional

  # Results of the build.
  attribute :results, Results.optional

  # Secrets to decrypt using Cloud Key Management Service.
  attribute :secrets, Types.Array(Secret).optional

  # The location of the source files to build.
  attribute :source, Source.optional

  # A permanent fixed identifier for source.
  attribute :source_provenance, SourceProvenance.optional

  # Time at which execution of the build was started.
  attribute :start_time, Types::String.optional

  # Status of the build.
  attribute :status, Types.Instance(Status).optional

  # Customer-readable message about the current status.
  attribute :status_detail, Types::String.optional

  # The operations to be performed on the workspace.
  attribute :steps, Types.Array(Step).optional

  # Substitutions data for `Build` resource.
  attribute :substitutions, Types::Hash.meta(of: Types::String).optional

  # Tags for annotation of a `Build`. These are not docker tags.
  attribute :tags, Types.Array(Types::String).optional

  # Amount of time that this build should be allowed to run, to second
  # granularity. If this amount of time elapses, work on the build will cease
  # and the build status will be `TIMEOUT`.
  attribute :timeout, BuildEventDataTimeout.optional

  # Stores timing information for phases of the build. Valid keys
  # are:
  #
  # * BUILD: time to execute all build steps
  # * PUSH: time to push all specified images.
  # * FETCHSOURCE: time to fetch source.
  #
  # If the build does not specify source or images,
  # these keys will not be included.
  attribute :timing, Types::Hash.meta(of: TimeSpan).optional
end
