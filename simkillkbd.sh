#!/bin/bash

if [ -z $1 ];then
  echo "Device UDID required"
  exit 1
fi

xcrun simctl spawn $1 launchctl stop com.apple.TextInput.kbd
