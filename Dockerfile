FROM superkkt/llvm:1

COPY . /src

RUN set -x \
 && apt-get update \	    
 && apt-get install -y ninja-build libunwind-dev libboost-fiber-dev libssl-dev autoconf-archive libtool cmake g++ libzstd-dev bison libxml2-dev zlib1g-dev

RUN cd /src \
 && ./helio/blaze.sh -release \
 && cd build-opt \
 && ninja dragonfly
