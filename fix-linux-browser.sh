#!/bin/sh
cd /compat/ubuntu/lib64 && rm ./ld-linux-x86-64.so.2; ln -s ../lib/x86_64-linux-gnu/ld-2.31.so ld-linux-x86-64.so.2
