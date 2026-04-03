#!/usr/bin/env bash
# Build all three DEBs.
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PKG="$DIR/packages"

make -C "$DIR"             clean package FINALPACKAGE=1 THEOS_PACKAGE_DIR="$PKG" "$@"
make -C "$DIR"             clean package FINALPACKAGE=1 THEOS_PACKAGE_SCHEME=rootless THEOS_PACKAGE_DIR="$PKG" "$@"
make -C "$DIR/assets-16"   clean package FINALPACKAGE=1 THEOS_PACKAGE_DIR="$PKG" "$@"
make -C "$DIR/assets-16"   clean package FINALPACKAGE=1 THEOS_PACKAGE_SCHEME=rootless THEOS_PACKAGE_DIR="$PKG" "$@"
make -C "$DIR/assets-17"   clean package FINALPACKAGE=1 THEOS_PACKAGE_SCHEME=rootless THEOS_PACKAGE_DIR="$PKG" "$@"
