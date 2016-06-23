#!/bin/bash

set -e

BAZEL_URL=https://github.com/bazelbuild/bazel/releases/download/0.3.0/bazel-0.3.0-installer-linux-x86_64.sh
JDK_SWITCHER_URL=https://raw.githubusercontent.com/michaelklishin/jdk_switcher/master/jdk_switcher.sh

curl -LO ${JDK_SWITCHER_URL}
source jdk_switcher.sh
jdk_switcher use oraclejdk8

curl -o bazel.sh -L ${BAZEL_URL}
chmod +x bazel.sh
./bazel.sh --user