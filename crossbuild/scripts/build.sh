#!/bin/sh
set -x
set -e

# Set up environment variables
BUILDPATH=${GOPATH}/src/github.com/Cimpress-MCP/go-git2consul
GOOS=linux
GOARCH=amd64
CGO_ENABLED=1
FLAGS=$(pkg-config --static --libs --cflags libssh2 libgit2 libssl libcurl)

# Link project source to $GOPATH/src/
mkdir -p $(dirname ${BUILDPATH})
ln -sf /app ${BUILDPATH}

# Get git commit information
GIT_COMMIT=$(git rev-parse HEAD)
GIT_DIRTY=$(test -n "`git status --porcelain`" && echo "+CHANGES" || true)

# Build git2consul
cd ${BUILDPATH}
go get -v -d
go build -ldflags "-X main.GitCommit=${GIT_COMMIT}${GIT_DIRTY} -v -linkmode external -s -extldflags '-static -zmuldefs ${FLAGS}'" -o /build/bin/git2consul.linux.amd64 . # Not sure if -s is needed
# GOOS=darwin GOARCH=amd64 CGO_ENABLED=1 go build -o /build/bin/git2consul.darwin.amd64 .
