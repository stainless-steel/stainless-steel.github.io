#!/bin/bash

set -ev

git config user.name "Travis CI"
git config user.email ""

URL="$(echo ${CRATE_NAME:=${TRAVIS_REPO_SLUG}} | cut -d '/' -f 2 | sed 's/-/_/g')/index.html"

HTML="<!DOCTYPE html>
<link rel='canonical' href='${URL}'>
<meta http-equiv='refresh' content='0; url=${URL}'>
<script>window.location='${URL}'</script>"

cargo doc
echo "${HTML}" > target/doc/index.html

sudo pip install ghp-import
ghp-import -m 'Updated the documentation' -n target/doc

git push -qf https://${GITHUB_TOKEN}@github.com/${TRAVIS_REPO_SLUG}.git gh-pages
