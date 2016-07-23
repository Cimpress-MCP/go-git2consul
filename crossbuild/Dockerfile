FROM multiarch/crossbuild

# Add testing repository for getting libgit2 0.24.x
RUN echo deb http://httpredir.debian.org/debian testing non-free contrib main > /etc/apt/sources.list.d/testing.list

RUN apt-get update
RUN apt-get install -q -y \
      binutils \
      pkg-config \
      libssh2-1-dev \
      libssl-dev \
      libgit2-dev \
      zlib1g-dev

COPY scripts /scripts
# RUN /scripts/configure.sh

# Install Go
ENV GO_VERSION 1.6.2
RUN curl -fsSL "https://storage.googleapis.com/golang/go${GO_VERSION}.linux-amd64.tar.gz" \
	| tar -xzC /usr/local

ENV PATH /go/bin:/usr/local/go/bin:$PATH
ENV GOPATH /go

WORKDIR /app

# ENTRYPOINT[ "/scripts/build.sh" ]
