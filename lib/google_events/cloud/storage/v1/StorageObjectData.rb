# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
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

  Int    = Strict::Int
  Bool   = Strict::Bool
  Hash   = Strict::Hash
  String = Strict::String
end

# Metadata of customer-supplied encryption key, if the object is encrypted by
# such a key.
class CustomerEncryption < Dry::Struct

  # The encryption algorithm.
  attribute :encryption_algorithm, Types::String.optional

  # SHA256 hash value of the encryption key.
  attribute :key_sha256, Types::String.optional
end

class Generation < Dry::Struct
  attribute :integer, Types::Int.optional
  attribute :string,  Types::String.optional
end

# An object within Google Cloud Storage.
class StorageObjectData < Dry::Struct

  # The name of the bucket containing this object.
  attribute :bucket, Types::String.optional

  # Cache-Control directive for the object data, matching
  # [https://tools.ietf.org/html/rfc7234#section-5.2"][RFC 7234 §5.2].
  attribute :cache_control, Types::String.optional

  # Number of underlying components that make up this object. Components are
  # accumulated by compose operations.
  # Attempting to set this field will result in an error.
  attribute :component_count, Types::Int.optional

  # Content-Disposition of the object data, matching
  # [https://tools.ietf.org/html/rfc6266][RFC 6266].
  attribute :content_disposition, Types::String.optional

  # Content-Encoding of the object data, matching
  # [https://tools.ietf.org/html/rfc7231#section-3.1.2.2][RFC 7231 §3.1.2.2]
  attribute :content_encoding, Types::String.optional

  # Content-Language of the object data, matching
  # [https://tools.ietf.org/html/rfc7231#section-3.1.3.2][RFC 7231 §3.1.3.2].
  attribute :content_language, Types::String.optional

  # Content-Type of the object data, matching
  # [https://tools.ietf.org/html/rfc7231#section-3.1.1.5][RFC 7231 §3.1.1.5].
  # If an object is stored without a Content-Type, it is served as
  # `application/octet-stream`.
  attribute :content_type, Types::String.optional

  # CRC32c checksum. For more information about using the CRC32c
  # checksum, see
  # [https://cloud.google.com/storage/docs/hashes-etags#_JSONAPI][Hashes and
  # ETags: Best Practices].
  attribute :crc32_c, Types::String.optional

  # Metadata of customer-supplied encryption key, if the object is encrypted by
  # such a key.
  attribute :customer_encryption, CustomerEncryption.optional

  # HTTP 1.1 Entity tag for the object. See
  # [https://tools.ietf.org/html/rfc7232#section-2.3][RFC 7232 §2.3].
  attribute :etag, Types::String.optional

  # Whether an object is under event-based hold.
  attribute :event_based_hold, Types::Bool.optional

  # The content generation of this object. Used for object versioning.
  # Attempting to set this field will result in an error.
  attribute :generation, Types.Instance(Generation).optional

  # The ID of the object, including the bucket name, object name, and
  # generation number.
  attribute :id, Types::String.optional

  # The kind of item this is. For objects, this is always "storage#object".
  attribute :kind, Types::String.optional

  # Cloud KMS Key used to encrypt this object, if the object is encrypted by
  # such a key.
  attribute :kms_key_name, Types::String.optional

  # MD5 hash of the data; encoded using base64 as per
  # [https://tools.ietf.org/html/rfc4648#section-4][RFC 4648 §4]. For more
  # information about using the MD5 hash, see
  # [https://cloud.google.com/storage/docs/hashes-etags#_JSONAPI][Hashes and
  # ETags: Best Practices].
  attribute :md5_hash, Types::String.optional

  # Media download link.
  attribute :media_link, Types::String.optional

  # User-provided metadata, in key/value pairs.
  attribute :metadata, Types::Hash.meta(of: Types::String).optional

  # The version of the metadata for this object at this generation. Used for
  # preconditions and for detecting changes in metadata. A metageneration
  # number is only meaningful in the context of a particular generation of a
  # particular object.
  attribute :metageneration, Types.Instance(Generation).optional

  # The name of the object.
  attribute :storage_object_data_name, Types::String.optional

  # A server-determined value that specifies the earliest time that the
  # object's retention period expires.
  attribute :retention_expiration_time, Types::String.optional

  # The link to this object.
  attribute :self_link, Types::String.optional

  # Content-Length of the object data in bytes, matching
  # [https://tools.ietf.org/html/rfc7230#section-3.3.2][RFC 7230 §3.3.2].
  attribute :size, Types.Instance(Generation).optional

  # Storage class of the object.
  attribute :storage_class, Types::String.optional

  # Whether an object is under temporary hold.
  attribute :temporary_hold, Types::Bool.optional

  # The creation time of the object.
  # Attempting to set this field will result in an error.
  attribute :time_created, Types::String.optional

  # The deletion time of the object. Will be returned if and only if this
  # version of the object has been deleted.
  attribute :time_deleted, Types::String.optional

  # The time at which the object's storage class was last changed.
  attribute :time_storage_class_updated, Types::String.optional

  # The modification time of the object metadata.
  attribute :updated, Types::String.optional
end
