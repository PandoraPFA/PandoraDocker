FROM ubuntu:eoan

RUN apt-get -qq update
RUN apt-get install -y wget git cmake g++ clang g++-7 clang-8

RUN apt-get install -y dpkg-dev binutils libx11-dev libxpm-dev libxft-dev libxext-dev xlibmesa-glu-dev

RUN apt-get install -y nano
RUN apt-get install -y curl

RUN wget http://bitbucket.org/eigen/eigen/get/3.3.5.tar.gz
RUN tar -xf 3.3.5.tar.gz && rm 3.3.5.tar.gz && mv eigen-eigen-b3f3d4950030 Eigen3
RUN cd Eigen3 && mkdir build && cd build && cmake -DCMAKE_INSTALL_PREFIX=/pandora/Eigen3 .. && make -j$(nproc) install

WORKDIR /pandora
ADD ./scripts /pandora
ADD root6-18-04.tar.gz /pandora

