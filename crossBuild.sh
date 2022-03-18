#!/bin/bash
git checkout master

rm -r build/
rm -r lib/

#Linux
mkdir build
mkdir lib
cd build
cmake .. -DBUILD_SHARED_LIBS=OFF -DASSIMP_BUILD_ZLIB=ON -DASSIMP_BUILD_ASSIMP_TOOLS=OFF -DASSIMP_BUILD_TESTS=OFF
make -j4
cd ..
cp -r ./build/lib/* ./lib/
mv ./lib/libassimp.a ./lib/libassimpLinux.a
cp ./build/include/assimp/config.h ./include/assimp/
