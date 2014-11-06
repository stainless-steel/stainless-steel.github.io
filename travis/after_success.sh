#!/bin/bash

set -ev

git config user.name "${GIT_NAME}"
git config user.email "${GIT_EMAIL}"

sudo pip install ghp-import
ghp-import -m 'Updated the documentation' -n target/doc

git push -qf https://${GH_TOKEN}@github.com/${TRAVIS_REPO_SLUG}.git gh-pages
