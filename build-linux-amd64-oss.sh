#!/bin/bash

set -xu

ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

PKG_DIR=$ROOT_DIR/pkg

[ -d $PKG_DIR ] && rm -Rf $PKG_DIR/* || mkdir -p $PKG_DIR
conan remote list
pushd $PKG_DIR
  conan create ../  psl/dev
popd 

