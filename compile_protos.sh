#!/bin/sh

mkdir -p definitions
pushd definitions
  mkdir -p gnmi
  pushd gnmi
    [ -f "gnmi.proto" ] || wget https://raw.githubusercontent.com/openconfig/gnmi/master/proto/gnmi/gnmi.proto
  popd
  mkdir -p github.com/openconfig/gnmi/proto/gnmi_ext
  pushd github.com/openconfig/gnmi/proto/gnmi_ext
  [ -f "gnmi_ext.proto" ] || wget https://raw.githubusercontent.com/openconfig/gnmi/master/proto/gnmi_ext/gnmi_ext.proto
  popd

  mkdir -p google/protobuf
  pushd google/protobuf
  [ -f "any.proto"] || wget https://raw.githubusercontent.com/protocolbuffers/protobuf/main/src/google/protobuf/any.proto
  [ -f "descriptor.proto"] || wget https://raw.githubusercontent.com/protocolbuffers/protobuf/main/src/google/protobuf/descriptor.proto
  popd
popd

set -x
protoc -I ./definitions --ruby_out ./lib ./definitions/gnmi.proto
