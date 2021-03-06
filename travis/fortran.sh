#!/bin/bash

set -v

if [ "${TRAVIS_OS_NAME}" == "osx" ]; then
  brew uninstall gcc49
  while true; do
    curl -L http://prdownloads.sourceforge.net/hpc/gcc-6.2-bin.tar.gz -o archive.tar.gz && break
  done
  mkdir root && tar -xzf archive.tar.gz -C root && sudo cp -R root/* /
fi

gfortran --version
