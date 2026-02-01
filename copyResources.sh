#!/usr/bin/env bash

IOS_VERSION=$1

if [ -z $IOS_VERSION ]; then
  echo "Runtime version required"
  exit 1
fi

if [ $(echo "${IOS_VERSION} >= 16.0" | bc) -eq 1 ]; then
EL_RUNTIME_ROOT=$(echo /Library/Developer/CoreSimulator/Volumes/*/Library/Developer/CoreSimulator/Profiles/Runtimes/iOS\ ${IOS_VERSION}.simruntime/Contents/Resources/RuntimeRoot)

echo "Remounting ${EL_RUNTIME_ROOT}/System/Library/PrivateFrameworks/CoreEmoji.framework as read-write..."
sh ../../Simulator/simject/remount.sh "${EL_RUNTIME_ROOT}/System/Library/PrivateFrameworks/CoreEmoji.framework"

else
EL_RUNTIME_ROOT=$(echo "/Library/Developer/CoreSimulator/Profiles/Runtimes/iOS\ ${IOS_VERSION}.simruntime/Contents/Resources/RuntimeRoot")
fi

sudo cp -vR ${PWD}/layout/System/Library/PrivateFrameworks/CoreEmoji.framework/* "${EL_RUNTIME_ROOT}/System/Library/PrivateFrameworks/CoreEmoji.framework/"
# sudo cp -vR ${PWD}/layout/System/LinguisticData/RequiredAssets_ja.bundle/* "${EL_RUNTIME_ROOT}/layout/System/LinguisticData/RequiredAssets_ja.bundle/"
