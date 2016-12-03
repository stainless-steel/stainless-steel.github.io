#!/bin/bash

set -v

BAZEL_URL=https://github.com/bazelbuild/bazel/releases/download/0.4.1/bazel-0.4.1-installer-linux-x86_64.sh
JDK_SWITCHER_URL=https://raw.githubusercontent.com/michaelklishin/jdk_switcher/master/jdk_switcher.sh

curl -L ${JDK_SWITCHER_URL} -o jdk_switcher.sh
source jdk_switcher.sh
jdk_switcher use oraclejdk8

set -e

curl -L ${BAZEL_URL} -o bazel.sh
chmod +x bazel.sh
./bazel.sh --user
