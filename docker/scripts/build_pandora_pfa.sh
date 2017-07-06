#!/bin/bash
set -e # script must exit if an error occurs

source /pandora/set_compiler_flags.sh

# Build project
mkdir build
cd build
cmake -DROOT_DIR=/pandora/root/cmake -DPANDORA_MONITORING=ON -DPANDORA_EXAMPLE_CONTENT=ON -DPANDORA_LAR_CONTENT=ON -DPANDORA_LC_CONTENT=ON ..

if [[ "$1" == "coverity" ]]; then
    source /pandora/prepend_coverity_path.sh
    cov-build --dir cov-int make -j2
    tar czvf coverity_build.tgz cov-int
else
    make -j2 install
fi

cd .. && rm -rf build

cd /pandora
