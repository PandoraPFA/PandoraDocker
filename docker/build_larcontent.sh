#!/bin/bash
set -e # script must exit if an error occurs

# Set compiler flags
if [ "$COMPILER " = "g++ " ]
then
    export CXX="g++"
    export CC="gcc"
elif [ "$COMPILER " = "clang " ]
then
    export CXX="clang++"
    export CC="clang"
fi

# Build project
mkdir build
cd build
cmake -DCMAKE_MODULE_PATH=/pandora/PandoraPFA/cmakemodules -DPANDORA_MONITORING=ON -DPandoraMonitoring_DIR=/pandora/PandoraMonitoring -DPandoraSDK_DIR=/pandora/PandoraSDK -DEigen3_DIR=/pandora/Eigen3/share/eigen3/cmake ..
make -j2 install
cd /pandora
