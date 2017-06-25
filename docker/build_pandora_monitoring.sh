#!/bin/bash
set -e # script must exit if an error occurs

source /pandora/set_compiler_flags.sh

# Build project
mkdir build
cd build
cmake -DCMAKE_MODULE_PATH=/pandora/PandoraPFA/cmakemodules -DROOT_DIR=/pandora/root/cmake -DPandoraSDK_DIR=/pandora/PandoraSDK ..
make -j2 install
cd /pandora
