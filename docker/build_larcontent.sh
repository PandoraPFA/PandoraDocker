#!/bin/bash
set -e # script must exit if an error occurs

source /pandora/set_compiler_flags.sh

# Build project
mkdir build
cd build
cmake -DCMAKE_MODULE_PATH=/pandora/PandoraPFA/cmakemodules -DPANDORA_MONITORING=ON -DPandoraMonitoring_DIR=/pandora/PandoraMonitoring -DPandoraSDK_DIR=/pandora/PandoraSDK -DEigen3_DIR=/pandora/Eigen3/share/eigen3/cmake ..
make -j2 install
cd /pandora
