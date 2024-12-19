# Build like this: 
# ```
# docker build -t yinguobing/rerun-cpp-sdk:0.21.0-ubuntu22.04 -f Dockerfile .
# ```
FROM ubuntu:22.04

LABEL image.authors="https://yinguobing.com"

# Disable interactive mode.
ARG DEBIAN_FRONTEND=noninteractive

# Update APT sourece
RUN sed -i 's/http:\/\/archive/http:\/\/cn.archive/' /etc/apt/sources.list && \
    apt-get update

WORKDIR /build

# Build tools
RUN apt-get install -y \
    build-essential curl git cmake

ARG PREFIX=/build/rerun-sdk-build
ADD .  ${PREFIX}
RUN cd ${PREFIX} && \
    mkdir -p build && cd build && \
    cmake ../src -DCMAKE_BUILD_TYPE=RELEASE && \
    make -j $(nproc) && make install && \
    cd .. && rm -r build
