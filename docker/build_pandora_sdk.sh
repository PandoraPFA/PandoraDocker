#!/bin/bash
set -e # script must exit if an error occurs

source /pandora/set_compiler_flags.sh

# Build project
mkdir build
cd build
cmake -DCMAKE_MODULE_PATH=/pandora/PandoraPFA/cmakemodules ..
make -j2 install
cd /pandora
