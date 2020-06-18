FROM ubuntu:bionic

RUN apt-get -qq update
RUN apt-get install -y wget git cmake g++ clang

RUN apt-get install -y dpkg-dev gcc binutils libx11-dev libxpm-dev libxft-dev libxext-dev xlibmesa-glu-dev

RUN wget https://root.cern.ch/download/root_v6.20.04.Linux-ubuntu18-x86_64-gcc7.5.tar.gz
RUN tar -xf root_v6.20.04.Linux-ubuntu18-x86_64-gcc7.5.tar.gz && rm root_v6.20.04.Linux-ubuntu16-x86_64-gcc7.5.tar.gz

RUN wget http://bitbucket.org/eigen/eigen/get/3.3.5.tar.gz
RUN tar -xf 3.3.5.tar.gz && rm 3.3.5.tar.gz && mv eigen-eigen-b3f3d4950030 Eigen3
RUN cd Eigen3 && mkdir build && cd build && cmake -DCMAKE_INSTALL_PREFIX=/pandora/Eigen3 .. && make -j$(nproc) install

WORKDIR /pandora
ADD ./scripts /pandora
