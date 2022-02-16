#!/bin/bash
git checkout master

rm -r build/
rm -r lib/

mkdir build
mkdir lib
cd build
cmake .. 
make -j4
cd ..
cp -r ./build/bin/* ./lib/
cp ./build/include/assimp/config.h ./include/assimp/
