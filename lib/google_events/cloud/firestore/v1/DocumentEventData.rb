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
  Double = Strict::Float | Strict::Int
end

# (forward declaration)
class MapValueField < Dry::Struct; end

# (forward declaration)
class MapValue < Dry::Struct; end

# (forward declaration)
class ValueElement < Dry::Struct; end

# (forward declaration)
class ArrayValue < Dry::Struct; end

# A geo point value representing a point on the surface of Earth.
class GeoPointValue < Dry::Struct

  # The latitude in degrees. It must be in the range [-90.0, +90.0].
  attribute :latitude, Types::Double.optional

  # The longitude in degrees. It must be in the range [-180.0, +180.0].
  attribute :longitude, Types::Double.optional
end

class IntegerValueUnion < Dry::Struct
  attribute :integer, Types::Int.optional
  attribute :string,  Types::String.optional
end

# A message that can hold any of the supported value types.
class MapValueField < Dry::Struct

  # An array value.
  #
  # Cannot directly contain another array value, though can contain an
  # map which contains another array.
  attribute :array_value, ArrayValue.optional

  # A boolean value.
  attribute :boolean_value, Types::Bool.optional

  # A bytes value.
  #
  # Must not exceed 1 MiB - 89 bytes.
  # Only the first 1,500 bytes are considered by queries.
  attribute :bytes_value, Types::String.optional

  # A double value.
  attribute :double_value, Types::Double.optional

  # A geo point value representing a point on the surface of Earth.
  attribute :geo_point_value, GeoPointValue.optional

  # An integer value.
  attribute :integer_value, Types.Instance(IntegerValueUnion).optional

  # A map value.
  attribute :map_value, MapValue.optional

  # A null value.
  attribute :null_value, Types.Instance(IntegerValueUnion).optional

  # A reference to a document. For example:
  # `projects/{project_id}/databases/{database_id}/documents/{document_path}`.
  attribute :reference_value, Types::String.optional

  # A string value.
  #
  # The string, represented as UTF-8, must not exceed 1 MiB - 89 bytes.
  # Only the first 1,500 bytes of the UTF-8 representation are considered by
  # queries.
  attribute :string_value, Types::String.optional

  # A timestamp value.
  #
  # Precise only to microseconds. When stored, any additional precision is
  # rounded down.
  attribute :timestamp_value, Types::String.optional
end

# A map value.
class MapValue < Dry::Struct

  # The map's fields.
  #
  # The map keys represent field names. Field names matching the regular
  # expression `__.*__` are reserved. Reserved field names are forbidden except
  # in certain documented contexts. The map keys, represented as UTF-8, must
  # not exceed 1,500 bytes and cannot be empty.
  attribute :fields, Types::Hash.meta(of: MapValueField).optional
end

# A message that can hold any of the supported value types.
class ValueElement < Dry::Struct

  # An array value.
  #
  # Cannot directly contain another array value, though can contain an
  # map which contains another array.
  attribute :array_value, ArrayValue.optional

  # A boolean value.
  attribute :boolean_value, Types::Bool.optional

  # A bytes value.
  #
  # Must not exceed 1 MiB - 89 bytes.
  # Only the first 1,500 bytes are considered by queries.
  attribute :bytes_value, Types::String.optional

  # A double value.
  attribute :double_value, Types::Double.optional

  # A geo point value representing a point on the surface of Earth.
  attribute :geo_point_value, GeoPointValue.optional

  # An integer value.
  attribute :integer_value, Types.Instance(IntegerValueUnion).optional

  # A map value.
  attribute :map_value, MapValue.optional

  # A null value.
  attribute :null_value, Types.Instance(IntegerValueUnion).optional

  # A reference to a document. For example:
  # `projects/{project_id}/databases/{database_id}/documents/{document_path}`.
  attribute :reference_value, Types::String.optional

  # A string value.
  #
  # The string, represented as UTF-8, must not exceed 1 MiB - 89 bytes.
  # Only the first 1,500 bytes of the UTF-8 representation are considered by
  # queries.
  attribute :string_value, Types::String.optional

  # A timestamp value.
  #
  # Precise only to microseconds. When stored, any additional precision is
  # rounded down.
  attribute :timestamp_value, Types::String.optional
end

# An array value.
#
# Cannot directly contain another array value, though can contain an
# map which contains another array.
class ArrayValue < Dry::Struct

  # Values in the array.
  attribute :values, Types.Array(ValueElement).optional
end

# A message that can hold any of the supported value types.
class OldValueField < Dry::Struct

  # An array value.
  #
  # Cannot directly contain another array value, though can contain an
  # map which contains another array.
  attribute :array_value, ArrayValue.optional

  # A boolean value.
  attribute :boolean_value, Types::Bool.optional

  # A bytes value.
  #
  # Must not exceed 1 MiB - 89 bytes.
  # Only the first 1,500 bytes are considered by queries.
  attribute :bytes_value, Types::String.optional

  # A double value.
  attribute :double_value, Types::Double.optional

  # A geo point value representing a point on the surface of Earth.
  attribute :geo_point_value, GeoPointValue.optional

  # An integer value.
  attribute :integer_value, Types.Instance(IntegerValueUnion).optional

  # A map value.
  attribute :map_value, MapValue.optional

  # A null value.
  attribute :null_value, Types.Instance(IntegerValueUnion).optional

  # A reference to a document. For example:
  # `projects/{project_id}/databases/{database_id}/documents/{document_path}`.
  attribute :reference_value, Types::String.optional

  # A string value.
  #
  # The string, represented as UTF-8, must not exceed 1 MiB - 89 bytes.
  # Only the first 1,500 bytes of the UTF-8 representation are considered by
  # queries.
  attribute :string_value, Types::String.optional

  # A timestamp value.
  #
  # Precise only to microseconds. When stored, any additional precision is
  # rounded down.
  attribute :timestamp_value, Types::String.optional
end

# A Document object containing a pre-operation document snapshot.
# This is only populated for update and delete events.
#
# A Firestore document.
class OldValue < Dry::Struct

  # The time at which the document was created.
  #
  # This value increases monotonically when a document is deleted then
  # recreated. It can also be compared to values from other documents and
  # the `read_time` of a query.
  attribute :create_time, Types::String.optional

  # The document's fields.
  #
  # The map keys represent field names.
  #
  # A simple field name contains only characters `a` to `z`, `A` to `Z`,
  # `0` to `9`, or `_`, and must not start with `0` to `9`. For example,
  # `foo_bar_17`.
  #
  # Field names matching the regular expression `__.*__` are reserved. Reserved
  # field names are forbidden except in certain documented contexts. The map
  # keys, represented as UTF-8, must not exceed 1,500 bytes and cannot be
  # empty.
  #
  # Field paths may be used in other contexts to refer to structured fields
  # defined here. For `map_value`, the field path is represented by the simple
  # or quoted field names of the containing fields, delimited by `.`. For
  # example, the structured field
  # `"foo" : { map_value: { "x&y" : { string_value: "hello" }}}` would be
  # represented by the field path `foo.x&y`.
  #
  # Within a field path, a quoted field name starts and ends with `` ` `` and
  # may contain any character. Some characters, including `` ` ``, must be
  # escaped using a `\`. For example, `` `x&y` `` represents `x&y` and
  # `` `bak\`tik` `` represents `` bak`tik ``.
  attribute :fields, Types::Hash.meta(of: OldValueField).optional

  # The resource name of the document, for example
  # `projects/{project_id}/databases/{database_id}/documents/{document_path}`.
  attribute :old_value_name, Types::String.optional

  # The time at which the document was last changed.
  #
  # This value is initially set to the `create_time` then increases
  # monotonically with each change to the document. It can also be
  # compared to values from other documents and the `read_time` of a query.
  attribute :update_time, Types::String.optional
end

# A DocumentMask object that lists changed fields.
# This is only populated for update events.
class UpdateMask < Dry::Struct

  # The list of field paths in the mask.
  # See [Document.fields][google.cloud.firestore.v1.events.Document.fields]
  # for a field path syntax reference.
  attribute :field_paths, Types.Array(Types::String).optional
end

# A Document object containing a post-operation document snapshot.
# This is not populated for delete events. (TODO: check this!)
#
# A Document object containing a pre-operation document snapshot.
# This is only populated for update and delete events.
#
# A Firestore document.
class Value < Dry::Struct

  # The time at which the document was created.
  #
  # This value increases monotonically when a document is deleted then
  # recreated. It can also be compared to values from other documents and
  # the `read_time` of a query.
  attribute :create_time, Types::String.optional

  # The document's fields.
  #
  # The map keys represent field names.
  #
  # A simple field name contains only characters `a` to `z`, `A` to `Z`,
  # `0` to `9`, or `_`, and must not start with `0` to `9`. For example,
  # `foo_bar_17`.
  #
  # Field names matching the regular expression `__.*__` are reserved. Reserved
  # field names are forbidden except in certain documented contexts. The map
  # keys, represented as UTF-8, must not exceed 1,500 bytes and cannot be
  # empty.
  #
  # Field paths may be used in other contexts to refer to structured fields
  # defined here. For `map_value`, the field path is represented by the simple
  # or quoted field names of the containing fields, delimited by `.`. For
  # example, the structured field
  # `"foo" : { map_value: { "x&y" : { string_value: "hello" }}}` would be
  # represented by the field path `foo.x&y`.
  #
  # Within a field path, a quoted field name starts and ends with `` ` `` and
  # may contain any character. Some characters, including `` ` ``, must be
  # escaped using a `\`. For example, `` `x&y` `` represents `x&y` and
  # `` `bak\`tik` `` represents `` bak`tik ``.
  attribute :fields, Types::Hash.meta(of: OldValueField).optional

  # The resource name of the document, for example
  # `projects/{project_id}/databases/{database_id}/documents/{document_path}`.
  attribute :value_name, Types::String.optional

  # The time at which the document was last changed.
  #
  # This value is initially set to the `create_time` then increases
  # monotonically with each change to the document. It can also be
  # compared to values from other documents and the `read_time` of a query.
  attribute :update_time, Types::String.optional
end

# The data within all Firestore document events.
class DocumentEventData < Dry::Struct

  # A Document object containing a pre-operation document snapshot.
  # This is only populated for update and delete events.
  attribute :old_value, OldValue.optional

  # A DocumentMask object that lists changed fields.
  # This is only populated for update events.
  attribute :update_mask, UpdateMask.optional

  # A Document object containing a post-operation document snapshot.
  # This is not populated for delete events. (TODO: check this!)
  attribute :value, Value.optional
end
