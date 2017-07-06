#!/bin/bash
if [ "$COMPILER " = "g++ " ]
then
    export CXX="g++"
    export CC="gcc"
elif [ "$COMPILER " = "clang " ]
then
    export CXX="clang++"
    export CC="clang"
fi
