# This code may look unusually verbose for Ruby (and it is), but
# it performs some subtle and complex validation of JSON data.
#
# To parse this JSON, add 'dry-struct' and 'dry-types' gems, then do:
#
#   message_published_data = MessagePublishedData.from_json! "{…}"
#   puts message_published_data.properties.message_published_event.properties.subscription.description
#
# If from_json! succeeds, the value returned matches the schema.

require 'json'
require 'dry-types'
require 'dry-struct'

module Types
  include Dry::Types.module

  Hash   = Strict::Hash
  String = Strict::String
end

class Subscription < Dry::Struct
  attribute :description,       Types::String
  attribute :subscription_type, Types::String

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      description:       d.fetch("description"),
      subscription_type: d.fetch("type"),
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "description" => @description,
      "type"        => @subscription_type,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class DataClass < Dry::Struct
  attribute :description, Types::String
  attribute :data_type,   Types::String
  attribute :data_format, Types::String

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      description: d.fetch("description"),
      data_type:   d.fetch("type"),
      data_format: d.fetch("format"),
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "description" => @description,
      "type"        => @data_type,
      "format"      => @data_format,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class PubsubMessageProperties < Dry::Struct
  attribute :data,       DataClass
  attribute :attributes, Subscription
  attribute :message_id, Subscription

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      data:       DataClass.from_dynamic!(d.fetch("data")),
      attributes: Subscription.from_dynamic!(d.fetch("attributes")),
      message_id: Subscription.from_dynamic!(d.fetch("messageId")),
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "data"       => @data.to_dynamic,
      "attributes" => @attributes.to_dynamic,
      "messageId"  => @message_id.to_dynamic,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class PubsubMessage < Dry::Struct
  attribute :pubsub_message_type, Types::String
  attribute :comment,             Types::String
  attribute :description,         Types::String
  attribute :properties,          PubsubMessageProperties

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      pubsub_message_type: d.fetch("type"),
      comment:             d.fetch("$comment"),
      description:         d.fetch("description"),
      properties:          PubsubMessageProperties.from_dynamic!(d.fetch("properties")),
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "type"        => @pubsub_message_type,
      "$comment"    => @comment,
      "description" => @description,
      "properties"  => @properties.to_dynamic,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class Definitions < Dry::Struct
  attribute :pubsub_message, PubsubMessage

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      pubsub_message: PubsubMessage.from_dynamic!(d.fetch("PubsubMessage")),
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "PubsubMessage" => @pubsub_message.to_dynamic,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class Message < Dry::Struct
  attribute :description, Types::String
  attribute :ref,         Types::String

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      description: d.fetch("description"),
      ref:         d.fetch("$ref"),
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "description" => @description,
      "$ref"        => @ref,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class MessagePublishedEventProperties < Dry::Struct
  attribute :message,      Message
  attribute :subscription, Subscription

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      message:      Message.from_dynamic!(d.fetch("message")),
      subscription: Subscription.from_dynamic!(d.fetch("subscription")),
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "message"      => @message.to_dynamic,
      "subscription" => @subscription.to_dynamic,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class MessagePublishedEvent < Dry::Struct
  attribute :description,                  Types::String
  attribute :message_published_event_type, Types::String
  attribute :definitions,                  Definitions
  attribute :properties,                   MessagePublishedEventProperties

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      description:                  d.fetch("description"),
      message_published_event_type: d.fetch("type"),
      definitions:                  Definitions.from_dynamic!(d.fetch("definitions")),
      properties:                   MessagePublishedEventProperties.from_dynamic!(d.fetch("properties")),
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "description" => @description,
      "type"        => @message_published_event_type,
      "definitions" => @definitions.to_dynamic,
      "properties"  => @properties.to_dynamic,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class MessagePublishedDataProperties < Dry::Struct
  attribute :message_published_event, MessagePublishedEvent

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      message_published_event: MessagePublishedEvent.from_dynamic!(d.fetch("MessagePublishedEvent")),
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "MessagePublishedEvent" => @message_published_event.to_dynamic,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class MessagePublishedData < Dry::Struct
  attribute :id,                          Types::String
  attribute :schema,                      Types::String
  attribute :title,                       Types::String
  attribute :description,                 Types::String
  attribute :message_published_data_name, Types::String
  attribute :go_package,                  Types::String
  attribute :properties,                  MessagePublishedDataProperties

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      id:                          d.fetch("$id"),
      schema:                      d.fetch("$schema"),
      title:                       d.fetch("title"),
      description:                 d.fetch("description"),
      message_published_data_name: d.fetch("name"),
      go_package:                  d.fetch("goPackage"),
      properties:                  MessagePublishedDataProperties.from_dynamic!(d.fetch("properties")),
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "$id"         => @id,
      "$schema"     => @schema,
      "title"       => @title,
      "description" => @description,
      "name"        => @message_published_data_name,
      "goPackage"   => @go_package,
      "properties"  => @properties.to_dynamic,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

message_published_data = MessagePublishedData.from_json! "{
  \"data\": {
      \"message\": {
          \"data\": \"SGVsbG8gdGhlcmU=\",
          \"messageId\": \"1408577928008405\",
          \"publishTime\": \"2020-08-06T22:31:14.536Z\"
      },
      \"subscription\": \"projects/MY-PROJECT/subscriptions/MY-SUB\"
  }
}"
puts message_published_data.properties.message_published_event.properties.subscription.