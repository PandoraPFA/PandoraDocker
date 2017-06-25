FROM ubuntu:xenial

RUN apt-get -qq update
RUN apt-get install -y wget git cmake g++ clang

RUN apt-get install -y dpkg-dev gcc binutils libx11-dev libxpm-dev libxft-dev libxext-dev xlibmesa-glu-dev

RUN wget https://root.cern.ch/download/root_v6.08.06.Linux-ubuntu16-x86_64-gcc5.4.tar.gz
RUN tar -xf root_v6.08.06.Linux-ubuntu16-x86_64-gcc5.4.tar.gz

WORKDIR /pandora
ADD . /pandora
