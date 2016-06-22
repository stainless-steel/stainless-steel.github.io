#!/bin/bash

set -ev

[ ! -z "${RUSTDOC_VERSION}" ] && [ "${TRAVIS_RUST_VERSION}" != "${RUSTDOC_VERSION}" ] && exit
[   -z "${RUSTDOC_VERSION}" ] && [ "${TRAVIS_RUST_VERSION}" != "nightly"            ] && exit

git config user.name "Travis CI"
git config user.email ""

if [ -z "${CRATE_NAME}" ]; then
  CRATE_NAME=$(echo ${TRAVIS_REPO_SLUG} | cut -d '/' -f 2 | sed 's/-/_/g')
fi

URL="${CRATE_NAME}/index.html"

HTML="<!DOCTYPE html>
<link rel='canonical' href='${URL}'>
<meta http-equiv='refresh' content='0; url=${URL}'>
<script>window.location='${URL}'</script>"

cargo doc ${CARGO_FLAGS}
echo "${HTML}" > target/doc/index.html

python -c 'import sys; print(sys.real_prefix)' 2> /dev/null
if [ $? -eq 0 ]; then
  pip install ghp-import
  GHP_IMPORT=ghp-import
else
  export PYTHONUSERBASE="${HOME}/.local"
  pip install ghp-import --user ${USER}
  GHP_IMPORT=${PYTHONUSERBASE}/bin/ghp-import
fi

${GHP_IMPORT} -m 'Update the documentation' -n target/doc

git push -qf https://${GITHUB_TOKEN}@github.com/${TRAVIS_REPO_SLUG}.git gh-pages
