#!/bin/bash
if [ "$COMPILER " = "g++-7 " ]
then
   export CXX="g++-7"
   export CC="gcc-7"
elif [ "$COMPILER " = "clang-8 " ]
then
   export CXX="clang++-8"
   export CC="clang-8"
elif [ "$COMPILER " = "g++ " ]
then
    export CXX="g++"
    export CC="gcc"
elif [ "$COMPILER " = "clang " ]
then
    export CXX="clang++"
    export CC="clang"
fi
