FROM multiarch/crossbuild

ENV CROSS_TRIPLE=x86_64-w64-mingw32
COPY scripts /scripts

RUN /scripts/configure.sh
