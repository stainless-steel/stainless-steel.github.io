#!/bin/bash

set -e

RUSTUP_URL=https://sh.rustup.rs

curl ${RUSTUP_URL} -sSf | sh -s -- --default-toolchain ${TRAVIS_RUST_VERSION} -y
export PATH="${HOME}/.cargo/bin:${PATH}"

rustc --version
cargo --version
