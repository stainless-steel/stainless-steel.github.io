#!/bin/bash

set -ev

git config user.name "${GIT_NAME}"
git config user.email "${GIT_EMAIL}"

URL="$(echo ${TRAVIS_REPO_SLUG} | cut -d '/' -f 2)/index.html"
INDEX="<!DOCTYPE html>
<link rel='canonical' href='${URL}'>
<meta http-equiv='refresh' content='0; url=${URL}'>
<script>window.location='${URL}'</script>"

cargo doc
echo "${INDEX}" > target/doc/index.html

sudo pip install ghp-import
ghp-import -m 'Updated the documentation' -n target/doc

git push -qf https://${GH_TOKEN}@github.com/${TRAVIS_REPO_SLUG}.git gh-pages
