FROM ubuntu:20.04

# Frog version to build
ARG FROG_VER=0.21

# Dependency version numbers
ARG FROGDATA_VER=0.18
ARG TICCUTILS_VER=0.24
ARG TIMBL_VER=6.5
ARG MBT_VER=3.6
ARG LIBFOLIA_VER=2.5.1
ARG UCTODATA_VER=0.8
ARG UCTO_VER=0.21.1

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    wget \
    file \
    pkg-config \
    build-essential \
    libexttextcat-dev \
    libxml2-dev \
    libz-dev \
    libbz2-dev \
    libtar-dev

WORKDIR /opt/frog

RUN wget -q https://github.com/LanguageMachines/ticcutils/releases/download/v0.24/ticcutils-${TICCUTILS_VER}.tar.gz
RUN tar -xf ticcutils-${TICCUTILS_VER}.tar.gz
RUN cd ticcutils-${TICCUTILS_VER} && ./configure && make -j $(nproc) && make install

RUN wget -q https://github.com/LanguageMachines/timbl/releases/download/v6.5/timbl-${TIMBL_VER}.tar.gz
RUN tar -xf timbl-${TIMBL_VER}.tar.gz
RUN cd timbl-${TIMBL_VER} && ./configure && make -j $(nproc) && make install

RUN wget -q https://github.com/LanguageMachines/mbt/releases/download/v3.6/mbt-${MBT_VER}.tar.gz
RUN tar -xf mbt-${MBT_VER}.tar.gz
RUN cd mbt-${MBT_VER} && ./configure && make -j $(nproc) && make install

RUN wget -q https://github.com/LanguageMachines/libfolia/releases/download/v2.5.1/libfolia-${LIBFOLIA_VER}.tar.gz
RUN tar -xf libfolia-${LIBFOLIA_VER}.tar.gz
RUN cd libfolia-${LIBFOLIA_VER} && ./configure && make -j $(nproc) && make install

RUN wget -q https://github.com/LanguageMachines/uctodata/releases/download/v0.8/uctodata-${UCTODATA_VER}.tar.gz
RUN tar -xf uctodata-${UCTODATA_VER}.tar.gz
RUN cd uctodata-${UCTODATA_VER} && ./configure && make -j $(nproc) && make install

RUN wget -q https://github.com/LanguageMachines/ucto/releases/download/v0.21.1/ucto-${UCTO_VER}.tar.gz
RUN tar -xf ucto-${UCTO_VER}.tar.gz
RUN cd ucto-${UCTO_VER} && ./configure && make -j $(nproc) && make install

RUN wget -q https://github.com/LanguageMachines/frogdata/releases/download/v0.18/frogdata-${FROGDATA_VER}.tar.gz
RUN tar -xf frogdata-${FROGDATA_VER}.tar.gz
RUN cd frogdata-${FROGDATA_VER} && ./configure && make -j $(nproc) && make install

RUN wget -q https://github.com/LanguageMachines/frog/releases/download/v0.21/frog-${FROG_VER}.tar.gz
RUN tar -xf frog-${FROG_VER}.tar.gz
RUN cd frog-${FROG_VER} && ./configure && make -j $(nproc) && make install

RUN ldconfig

ENTRYPOINT ["frog"]
