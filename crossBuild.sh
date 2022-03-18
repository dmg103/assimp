#!/bin/bash
git checkout master

patch -ulbf code/Common/ZipArchiveIOSystem.cpp << EOF
@@ -198,3 +198,5 @@
     mapping.zopen_file = (open_file_func)open;
+#ifdef ZOPENDISK64
     mapping.zopendisk_file = (opendisk_file_func)opendisk;
+#endif
     mapping.zread_file = (read_file_func)read;
EOF

rm -r build/
rm -r lib/

#Linux
mkdir build
mkdir lib
cd build
cmake .. -DBUILD_SHARED_LIBS=OFF
make -j4
cd ..
cp -r ./build/lib/* ./lib/
mv ./lib/libassimp.a ./lib/libassimpLinux.a
cp ./build/include/assimp/config.h ./include/assimp/

#rm -r build/
#
##Windows
#mkdir build
#cd build
#cmake -D CMAKE_CXX_COMPILER=x86_64-w64-mingw32-g++ .. -DBUILD_SHARED_LIBS=OFF
#make -j
#cd ..
#cp -r ./build/lib/* ./lib/
#mv ./lib/libassimp.a ./lib/libassimpWin.a
#cp ./build/include/assimp/config.h ./include/assimp/
