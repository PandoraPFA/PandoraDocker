#!/bin/bash
set -e # script must exit if an error occurs

# Get Eigen
cd /pandora
wget http://bitbucket.org/eigen/eigen/get/3.3.3.tar.gz
tar -xf 3.3.3.tar.gz
mv eigen-eigen-67e894c6cd8f Eigen3

source /pandora/set_compiler_flags.sh

# Install Eigen
cd Eigen3
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=/pandora/Eigen3 ..
make -j2 install
cd /pandora
