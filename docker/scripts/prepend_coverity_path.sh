#!/bin/bash
export PATH=/pandora/package/cov-analysis-linux64/bin:$PATH

cov-configure -co /usr/bin/g++-7 -- -std=c++17 $1
