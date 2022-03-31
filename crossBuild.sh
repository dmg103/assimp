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
cp ./build/contrib/zlib/libzlibstatic.a ./lib/
mv ./lib/libassimp.a ./lib/libassimpLinux.a
mv ./lib/libzlibstatic.a ./lib/libzlibstaticLinux.a
cp ./build/include/assimp/config.h ./include/assimp/

rm -r build/

#Switch
mkdir build
cd build
cmake .. -DCMAKE_TOOLCHAIN_FILE=/opt/devkitpro/cmake/Switch.cmake -DBUILD_SHARED_LIBS=OFF -DASSIMP_BUILD_ZLIB=ON -DASSIMP_BUILD_ASSIMP_TOOLS=OFF -DASSIMP_BUILD_TESTS=OFF -DASSIMP_BUILD_SWITCH=TRUE
make -j4
cd ..
cp -r ./build/lib/* ./lib/
cp ./build/contrib/zlib/libzlibstatic.a ./lib/
mv ./lib/libassimp.a ./lib/libassimpSwitch.a
mv ./lib/libzlibstatic.a ./lib/libzlibstaticSwitch.a
cp ./build/include/assimp/config.h ./include/assimp/