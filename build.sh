#!/bin/bash

gcc \
  -m32 \
  -static \
  -nostdlib \
  -masm=intel \
  -nostartfiles \
  -Wl,--build-id=none \
  "$1".s -o "$1"

if [ "$?" != 0 ]; then
  echo "not built"
  exit 1
fi
