#!/bin/bash

set -ev

if [ ! -z "${RUSTDOC_VERSION}" ] && [ "${RUSTDOC_VERSION}" != "${TRAVIS_RUST_VERSION}" ]; then
  exit
fi

curl https://stainless-steel.github.io/travis/update_documentation.sh | bash
