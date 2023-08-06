#!/bin/bash

gdb ./lab \
  -ex 'b _start' \
  -ex 'run' \
  -ex 'source gdb.py' \
  -ex 'skpl'
