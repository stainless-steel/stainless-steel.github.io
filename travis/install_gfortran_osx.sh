#!/bin/bash

set -ev

ARCHIVE=gcc-5.3-bin.tar.gz
curl -LO http://prdownloads.sourceforge.net/hpc/${ARCHIVE}

mkdir gcc
tar -xzf ${ARCHIVE} -C gcc

ROOT="$PWD/gcc/local"
export PATH="$ROOT/bin:$PATH"
export DYLD_LIBRARY_PATH="$ROOT/lib:$DYLD_LIBRARY_PATH"

gfortran --version
