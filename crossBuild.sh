#!/bin/bash

rm -r build/
rm -r bin/

mkdir build
mkdir bin
cd build
cmake .. 
make -j4
cd ..
cp -r ./build/bin/* ./bin/