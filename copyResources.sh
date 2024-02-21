#!/usr/bin/env bash

if [ -z $1 ]; then
  echo "Runtime version required"
  exit 1
fi

EL_RUNTIME_ROOT=/Library/Developer/CoreSimulator/Profiles/Runtimes/iOS\ ${1}.simruntime/Contents/Resources/RuntimeRoot

sudo cp -vR ${PWD}/layout/System/Library/PrivateFrameworks/CoreEmoji.framework/* "${EL_RUNTIME_ROOT}/System/Library/PrivateFrameworks/CoreEmoji.framework/"
# sudo cp -vR ${PWD}/layout/System/LinguisticData/RequiredAssets_ja.bundle/* "${EL_RUNTIME_ROOT}/layout/System/LinguisticData/RequiredAssets_ja.bundle/"
