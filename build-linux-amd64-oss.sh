#!/bin/bash

set -xu

ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

TEST_BUILD_DIR=$ROOT_DIR/build

[ -d $TEST_BUILD_DIR ] && rm -Rf $TEST_BUILD_DIR/* || mkdir -p $TEST_BUILD_DIR
conan remote list
conan create $ROOT_DIR   -tbf $TEST_BUILD_DIR

