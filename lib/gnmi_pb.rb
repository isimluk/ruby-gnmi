# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: gnmi.proto

require 'google/protobuf'

require 'google/protobuf/any_pb'
require 'google/protobuf/descriptor_pb'
require 'github.com/openconfig/gnmi/proto/gnmi_ext/gnmi_ext_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("gnmi.proto", :syntax => :proto3) do
    add_message "gnmi.Notification" do
      optional :timestamp, :int64, 1
      optional :prefix, :message, 2, "gnmi.Path"
      repeated :update, :message, 4, "gnmi.Update"
      repeated :delete, :message, 5, "gnmi.Path"
      optional :atomic, :bool, 6
    end
    add_message "gnmi.Update" do
      optional :path, :message, 1, "gnmi.Path"
      optional :value, :message, 2, "gnmi.Value"
      optional :val, :message, 3, "gnmi.TypedValue"
      optional :duplicates, :uint32, 4
    end
    add_message "gnmi.TypedValue" do
      oneof :value do
        optional :string_val, :string, 1
        optional :int_val, :int64, 2
        optional :uint_val, :uint64, 3
        optional :bool_val, :bool, 4
        optional :bytes_val, :bytes, 5
        optional :float_val, :float, 6
        optional :double_val, :double, 14
        optional :decimal_val, :message, 7, "gnmi.Decimal64"
        optional :leaflist_val, :message, 8, "gnmi.ScalarArray"
        optional :any_val, :message, 9, "google.protobuf.Any"
        optional :json_val, :bytes, 10
        optional :json_ietf_val, :bytes, 11
        optional :ascii_val, :string, 12
        optional :proto_bytes, :bytes, 13
      end
    end
    add_message "gnmi.Path" do
      repeated :element, :string, 1
      optional :origin, :string, 2
      repeated :elem, :message, 3, "gnmi.PathElem"
      optional :target, :string, 4
    end
    add_message "gnmi.PathElem" do
      optional :name, :string, 1
      map :key, :string, :string, 2
    end
    add_message "gnmi.Value" do
      optional :value, :bytes, 1
      optional :type, :enum, 2, "gnmi.Encoding"
    end
    add_message "gnmi.Error" do
      optional :code, :uint32, 1
      optional :message, :string, 2
      optional :data, :message, 3, "google.protobuf.Any"
    end
    add_message "gnmi.Decimal64" do
      optional :digits, :int64, 1
      optional :precision, :uint32, 2
    end
    add_message "gnmi.ScalarArray" do
      repeated :element, :message, 1, "gnmi.TypedValue"
    end
    add_message "gnmi.SubscribeRequest" do
      repeated :extension, :message, 5, "gnmi_ext.Extension"
      oneof :request do
        optional :subscribe, :message, 1, "gnmi.SubscriptionList"
        optional :poll, :message, 3, "gnmi.Poll"
      end
    end
    add_message "gnmi.Poll" do
    end
    add_message "gnmi.SubscribeResponse" do
      repeated :extension, :message, 5, "gnmi_ext.Extension"
      oneof :response do
        optional :update, :message, 1, "gnmi.Notification"
        optional :sync_response, :bool, 3
        optional :error, :message, 4, "gnmi.Error"
      end
    end
    add_message "gnmi.SubscriptionList" do
      optional :prefix, :message, 1, "gnmi.Path"
      repeated :subscription, :message, 2, "gnmi.Subscription"
      optional :qos, :message, 4, "gnmi.QOSMarking"
      optional :mode, :enum, 5, "gnmi.SubscriptionList.Mode"
      optional :allow_aggregation, :bool, 6
      repeated :use_models, :message, 7, "gnmi.ModelData"
      optional :encoding, :enum, 8, "gnmi.Encoding"
      optional :updates_only, :bool, 9
    end
    add_enum "gnmi.SubscriptionList.Mode" do
      value :STREAM, 0
      value :ONCE, 1
      value :POLL, 2
    end
    add_message "gnmi.Subscription" do
      optional :path, :message, 1, "gnmi.Path"
      optional :mode, :enum, 2, "gnmi.SubscriptionMode"
      optional :sample_interval, :uint64, 3
      optional :suppress_redundant, :bool, 4
      optional :heartbeat_interval, :uint64, 5
    end
    add_message "gnmi.QOSMarking" do
      optional :marking, :uint32, 1
    end
    add_message "gnmi.SetRequest" do
      optional :prefix, :message, 1, "gnmi.Path"
      repeated :delete, :message, 2, "gnmi.Path"
      repeated :replace, :message, 3, "gnmi.Update"
      repeated :update, :message, 4, "gnmi.Update"
      repeated :union_replace, :message, 6, "gnmi.Update"
      repeated :extension, :message, 5, "gnmi_ext.Extension"
    end
    add_message "gnmi.SetResponse" do
      optional :prefix, :message, 1, "gnmi.Path"
      repeated :response, :message, 2, "gnmi.UpdateResult"
      optional :message, :message, 3, "gnmi.Error"
      optional :timestamp, :int64, 4
      repeated :extension, :message, 5, "gnmi_ext.Extension"
    end
    add_message "gnmi.UpdateResult" do
      optional :timestamp, :int64, 1
      optional :path, :message, 2, "gnmi.Path"
      optional :message, :message, 3, "gnmi.Error"
      optional :op, :enum, 4, "gnmi.UpdateResult.Operation"
    end
    add_enum "gnmi.UpdateResult.Operation" do
      value :INVALID, 0
      value :DELETE, 1
      value :REPLACE, 2
      value :UPDATE, 3
      value :UNION_REPLACE, 4
    end
    add_message "gnmi.GetRequest" do
      optional :prefix, :message, 1, "gnmi.Path"
      repeated :path, :message, 2, "gnmi.Path"
      optional :type, :enum, 3, "gnmi.GetRequest.DataType"
      optional :encoding, :enum, 5, "gnmi.Encoding"
      repeated :use_models, :message, 6, "gnmi.ModelData"
      repeated :extension, :message, 7, "gnmi_ext.Extension"
    end
    add_enum "gnmi.GetRequest.DataType" do
      value :ALL, 0
      value :CONFIG, 1
      value :STATE, 2
      value :OPERATIONAL, 3
    end
    add_message "gnmi.GetResponse" do
      repeated :notification, :message, 1, "gnmi.Notification"
      optional :error, :message, 2, "gnmi.Error"
      repeated :extension, :message, 3, "gnmi_ext.Extension"
    end
    add_message "gnmi.CapabilityRequest" do
      repeated :extension, :message, 1, "gnmi_ext.Extension"
    end
    add_message "gnmi.CapabilityResponse" do
      repeated :supported_models, :message, 1, "gnmi.ModelData"
      repeated :supported_encodings, :enum, 2, "gnmi.Encoding"
      optional :gNMI_version, :string, 3
      repeated :extension, :message, 4, "gnmi_ext.Extension"
    end
    add_message "gnmi.ModelData" do
      optional :name, :string, 1
      optional :organization, :string, 2
      optional :version, :string, 3
    end
    add_enum "gnmi.Encoding" do
      value :JSON, 0
      value :BYTES, 1
      value :PROTO, 2
      value :ASCII, 3
      value :JSON_IETF, 4
    end
    add_enum "gnmi.SubscriptionMode" do
      value :TARGET_DEFINED, 0
      value :ON_CHANGE, 1
      value :SAMPLE, 2
    end
  end
end

module Gnmi
  Notification = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gnmi.Notification").msgclass
  Update = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gnmi.Update").msgclass
  TypedValue = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gnmi.TypedValue").msgclass
  Path = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gnmi.Path").msgclass
  PathElem = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gnmi.PathElem").msgclass
  Value = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gnmi.Value").msgclass
  Error = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gnmi.Error").msgclass
  Decimal64 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gnmi.Decimal64").msgclass
  ScalarArray = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gnmi.ScalarArray").msgclass
  SubscribeRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gnmi.SubscribeRequest").msgclass
  Poll = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gnmi.Poll").msgclass
  SubscribeResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gnmi.SubscribeResponse").msgclass
  SubscriptionList = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gnmi.SubscriptionList").msgclass
  SubscriptionList::Mode = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gnmi.SubscriptionList.Mode").enummodule
  Subscription = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gnmi.Subscription").msgclass
  QOSMarking = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gnmi.QOSMarking").msgclass
  SetRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gnmi.SetRequest").msgclass
  SetResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gnmi.SetResponse").msgclass
  UpdateResult = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gnmi.UpdateResult").msgclass
  UpdateResult::Operation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gnmi.UpdateResult.Operation").enummodule
  GetRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gnmi.GetRequest").msgclass
  GetRequest::DataType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gnmi.GetRequest.DataType").enummodule
  GetResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gnmi.GetResponse").msgclass
  CapabilityRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gnmi.CapabilityRequest").msgclass
  CapabilityResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gnmi.CapabilityResponse").msgclass
  ModelData = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gnmi.ModelData").msgclass
  Encoding = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gnmi.Encoding").enummodule
  SubscriptionMode = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gnmi.SubscriptionMode").enummodule
end
