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

class IntValue < Dry::Struct
  attribute :integer, Types::Int.optional
  attribute :string,  Types::String.optional
end

# Value for Event Params and UserProperty can be of type string or int or
# float or double.
class AnalyticsValue < Dry::Struct
  attribute :double_value, Types::Double.optional
  attribute :float_value,  Types::Double.optional
  attribute :int_value,    Types.Instance(IntValue).optional
  attribute :string_value, Types::String.optional
end

# Message containing information pertaining to the event.
class EventDim < Dry::Struct

  # The date on which this event was logged.
  # (YYYYMMDD format in the registered timezone of your app.)
  attribute :date, Types::String.optional

  # The name of this event.
  attribute :event_dim_name, Types::String.optional

  # A repeated record of the parameters associated with this event.
  attribute :params, Types::Hash.meta(of: AnalyticsValue).optional

  # UTC client time when the previous event happened.
  attribute :previous_timestamp_micros, Types.Instance(IntValue).optional

  # UTC client time when the event happened.
  attribute :timestamp_micros, Types.Instance(IntValue).optional

  # Value param in USD.
  attribute :value_in_usd, Types::Double.optional
end

# App information.
class AppInfo < Dry::Struct

  # Unique application identifier within an app store.
  attribute :app_id, Types::String.optional

  # Unique id for this instance of the app.
  # Example: "71683BF9FA3B4B0D9535A1F05188BAF3"
  attribute :app_instance_id, Types::String.optional

  # The app platform.
  # Eg "ANDROID", "IOS".
  attribute :app_platform, Types::String.optional

  # The identifier of the store that installed the app.
  # Eg. "com.sec.android.app.samsungapps", "com.amazon.venezia",
  # "com.nokia.nstore"
  attribute :app_store, Types::String.optional

  # The app's version name
  # Examples: "1.0", "4.3.1.1.213361", "2.3 (1824253)", "v1.8b22p6"
  attribute :app_version, Types::String.optional
end

# Information regarding the bundle in which these events were uploaded.
class BundleInfo < Dry::Struct

  # Monotonically increasing index for each bundle set by SDK.
  attribute :bundle_sequence_id, Types::Int.optional

  # Timestamp offset between collection time and upload time.
  attribute :server_timestamp_offset_micros, Types.Instance(IntValue).optional
end

# Device information.
class DeviceInfo < Dry::Struct

  # Device category.
  # Eg. tablet or mobile.
  attribute :device_category, Types::String.optional

  # Vendor specific device identifier. This is IDFV on iOS. Not used for
  # Android.
  # Example: "599F9C00-92DC-4B5C-9464-7971F01F8370"
  attribute :device_id, Types::String.optional

  # Device model.
  # Eg. GT-I9192
  attribute :device_model, Types::String.optional

  # The timezone of the device when data was uploaded as seconds skew from UTC.
  attribute :device_time_zone_offset_seconds, Types::Int.optional

  # The device's Limit Ad Tracking setting.
  # When true, we cannot use device_id for remarketing, demographics or
  # influencing ads serving behaviour. However, we can use device_id for
  # conversion tracking and campaign attribution.
  attribute :limited_ad_tracking, Types::Bool.optional

  # Device brand name.
  # Eg. Samsung, HTC, etc.
  attribute :mobile_brand_name, Types::String.optional

  # Device marketing name.
  # Eg. Galaxy S4 Mini
  attribute :mobile_marketing_name, Types::String.optional

  # Device model name.
  # Eg. GT-I9192
  attribute :mobile_model_name, Types::String.optional

  # Device OS version when data capture ended.
  # Eg. 4.4.2
  attribute :platform_version, Types::String.optional

  # The type of the resettable_device_id is always IDFA on iOS and AdId
  # on Android.
  # Example: "71683BF9-FA3B-4B0D-9535-A1F05188BAF3"
  attribute :resettable_device_id, Types::String.optional

  # The user language.
  # Eg. "en-us", "en-za", "zh-tw", "jp"
  attribute :user_default_language, Types::String.optional
end

# User's geographic information.
class GeoInfo < Dry::Struct

  # The geographic city.
  # Eg. Sao Paulo
  attribute :city, Types::String.optional

  # The geographic continent.
  # Eg. Americas
  attribute :continent, Types::String.optional

  # The geographic country.
  # Eg. Brazil
  attribute :country, Types::String.optional

  # The geographic region.
  # Eg. State of Sao Paulo
  attribute :region, Types::String.optional
end

# Lifetime Value information about this user.
class LtvInfo < Dry::Struct

  # The currency corresponding to the revenue.
  attribute :currency, Types::String.optional

  # The Lifetime Value revenue of this user.
  attribute :revenue, Types::Double.optional
end

# Information about marketing campaign which acquired the user.
class TrafficSource < Dry::Struct

  # The name of the campaign which acquired the user.
  attribute :user_acquired_campaign, Types::String.optional

  # The name of the medium which acquired the user.
  attribute :user_acquired_medium, Types::String.optional

  # The name of the network which acquired the user.
  attribute :user_acquired_source, Types::String.optional
end

# Last set value of user property.
#
# Value for Event Params and UserProperty can be of type string or int or
# float or double.
class Value < Dry::Struct
  attribute :double_value, Types::Double.optional
  attribute :float_value,  Types::Double.optional
  attribute :int_value,    Types.Instance(IntValue).optional
  attribute :string_value, Types::String.optional
end

class UserProperty < Dry::Struct

  # Index for user property (one-based).
  attribute :index, Types::Int.optional

  # UTC client time when user property was last set.
  attribute :set_timestamp_usec, Types.Instance(IntValue).optional

  # Last set value of user property.
  attribute :value, Value.optional
end

# User related dimensions.
class UserDim < Dry::Struct

  # App information.
  attribute :app_info, AppInfo.optional

  # Information regarding the bundle in which these events were uploaded.
  attribute :bundle_info, BundleInfo.optional

  # Device information.
  attribute :device_info, DeviceInfo.optional

  # The time (in microseconds) at which the user first opened the app.
  attribute :first_open_timestamp_micros, Types.Instance(IntValue).optional

  # User's geographic information.
  attribute :geo_info, GeoInfo.optional

  # Lifetime Value information about this user.
  attribute :ltv_info, LtvInfo.optional

  # Information about marketing campaign which acquired the user.
  attribute :traffic_source, TrafficSource.optional

  # The user ID set via the setUserId API.
  attribute :user_id, Types::String.optional

  # A repeated record of user properties set with the setUserProperty API.
  # https://firebase.google.com/docs/analytics/android/properties
  attribute :user_properties, Types::Hash.meta(of: UserProperty).optional
end

# The data within Firebase Analytics log events.
class AnalyticsLogData < Dry::Struct

  # A repeated record of event related dimensions.
  attribute :event_dim, Types.Array(EventDim).optional

  # User related dimensions.
  attribute :user_dim, UserDim.optional
end
