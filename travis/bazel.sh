#!/bin/bash

BAZEL_URL=https://github.com/bazelbuild/bazel/releases/download/0.3.1/bazel-0.3.1-installer-linux-x86_64.sh
JDK_SWITCHER_URL=https://raw.githubusercontent.com/michaelklishin/jdk_switcher/master/jdk_switcher.sh

curl -LO ${JDK_SWITCHER_URL}
source jdk_switcher.sh
jdk_switcher use oraclejdk8

set -e

curl -o bazel.sh -L ${BAZEL_URL}
chmod +x bazel.sh
./bazel.sh --user
