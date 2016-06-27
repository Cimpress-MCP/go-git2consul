#!/bin/sh
set -x
set -e

# Set temp environment vars
export REPO=https://github.com/openssl/openssl.git
export BRANCH=OpenSSL_1_0_2h
export BUILD_PATH=/tmp/openssl
export MAKEDEPPROG="/usr/x86_64-apple-darwin14/bin/cc -M"

# Compile & Install openssl (v0.24)
git clone -b ${BRANCH} --depth 1 -- ${REPO} ${BUILD_PATH}

mkdir -p ${BUILD_PATH}/install/lib
cd ${BUILD_PATH}
./Configure darwin64-x86_64-cc &&
make depend &&
make &&
make install

# Cleanup
# rm -r ${LIBGIT2PATH}
