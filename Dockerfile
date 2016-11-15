FROM ubuntu:yakkety

RUN apt-get update && \
    apt-get -y install unzip git make gcc-arm-none-eabi

RUN mkdir /build
WORKDIR /build

# RUN mkdir /build/jpearman && \
#     git clone git://github.com/jpearman/convex.git /build/jpearman/convex && \
#     unzip -q /build/jpearman/convex/ChibiOS_2.6.2.zip -d /build && \
#     ln -svf /build/jpearman/convex/convex /build/convex

RUN mkdir /build/jpearman && \
    git clone git://github.com/jpearman/convex.git /build/jpearman/convex && \
    ln -svf /build/jpearman/convex/convex /build/convex && \
    mkdir /build/ChibiOS && \
    git clone git://github.com/ChibiOS/ChibiOS.git /build/ChibiOS/ChibiOS && \
    (cd /build/ChibiOS/ChibiOS && git checkout stable_2.6.x) && \
    ln -svf /build/ChibiOS/ChibiOS /build/ChibiOS_2.6.x
