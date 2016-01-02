#!/bin/bash

set -ev

if [ "${TRAVIS_OS_NAME}" == "osx" ]; then
  BREW_PATH=$(brew --prefix)
  RUST_PATH=$(dirname $(dirname $(which rustc)))
  LIBRARY_PATH=`find "${BREW_PATH}" -name libgfortran.dylib | grep -v i386`
  ln -s "${LIBRARY_PATH}" "${RUST_PATH}/lib/rustlib/x86_64-apple-darwin/lib/libgfortran.dylib"
fi

gfortran --version
