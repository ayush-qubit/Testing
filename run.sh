#!/bin/bash



CC="$LLVM_HOME/bin/clang"
OPT="$LLVM_HOME/bin/opt"

TESTING="./build/testing"

FILENAME=$(basename $1 .c)

clang-12 -emit-llvm -fno-discard-value-names -S -g -o $FILENAME.ll $1

$TESTING $FILENAME.ll