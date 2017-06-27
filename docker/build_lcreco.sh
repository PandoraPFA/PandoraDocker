#!/bin/bash
set -e # script must exit if an error occurs

source /pandora/set_compiler_flags.sh

# Build project
mkdir build
cd build
cmake -DCMAKE_MODULE_PATH=/pandora/PandoraPFA/cmakemodules -DPANDORA_MONITORING=ON -DPandoraSDK_DIR=/pandora/PandoraSDK -DPandoraMonitoring_DIR=/pandora/PandoraMonitoring -DLCContent_DIR=/pandora/LCContent ..
make -j2 install
cd /pandora
