#!/bin/bash

set -v

if [ "${TRAVIS_OS_NAME}" == "osx" ]; then
  ROOT_PATH="${PWD}/gfortran"
  (
      ARCHIVE_NAME="gcc-6.2-bin.tar.gz"
      ARCHIVE_URL="http://prdownloads.sourceforge.net/hpc/${ARCHIVE_NAME}"
      mkdir "${ROOT_PATH}" && cd "${ROOT_PATH}"
      curl -LO "${ARCHIVE_URL}" && tar -xzf "${ARCHIVE_NAME}"
  )
  LIBRARY_NAME="libgfortran.dylib"
  LIBRARY_PATH="${ROOT_PATH}/usr/local/lib"
  export PATH="${ROOT_PATH}/usr/local/bin:${PATH}"
  export DYLD_LIBRARY_PATH="${LIBRARY_PATH}:${DYLD_LIBRARY_PATH}"
  RUST_PATH=$(dirname $(dirname $(which rustc)))
  ln -s "${LIBRARY_PATH}/${LIBRARY_NAME}" "${RUST_PATH}/lib/rustlib/x86_64-apple-darwin/lib/${LIBRARY_NAME}"
fi

gfortran --version
