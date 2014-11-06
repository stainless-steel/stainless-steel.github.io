#!/bin/bash

sudo pip install ghp-import &&
ghp-import -n target/doc &&
git push -qf https://${GH_TOKEN}@github.com/${TRAVIS_REPO_SLUG}.git gh-pages
