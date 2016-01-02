#!/bin/bash

set -ev

if [ "${TRAVIS_OS_NAME}" != "osx" ]; then
  exit
fi

BREW_PATH=`brew --prefix`
RUST_PATH="${HOME}/rust"
LIBRARY_PATH=`find "${BREW_PATH}" -name libgfortran.dylib | grep -v i386`
ln -s "${LIBRARY_PATH}" "${RUST_PATH}/lib/rustlib/x86_64-apple-darwin/lib/libgfortran.dylib"
