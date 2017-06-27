#!/bin/bash
set -e # script must exit if an error occurs

source /pandora/set_compiler_flags.sh

# Build project
mkdir build
cd build
cmake -DROOT_DIR=/pandora/root/cmake -DPANDORA_MONITORING=ON -DPANDORA_EXAMPLE_CONTENT=ON -DPANDORA_LAR_CONTENT=ON -DPANDORA_LC_CONTENT=ON ..
make -j2 install
cd /pandora
