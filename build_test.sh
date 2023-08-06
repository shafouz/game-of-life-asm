#!/bin/bash

gcc -static -m32 -Wall test.c lib.s -o test

if [ "$?" != 0 ]; then
  echo "not built"
  exit 1
fi
