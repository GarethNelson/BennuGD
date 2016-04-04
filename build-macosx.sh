#!/bin/sh



echo "### Building BennuGD Core ###"

cd core
./configure
make clean
make
cd ..

echo "### Building BennuGD Modules ###"

cd modules
./configure
make clean
make
cd ..

echo "### Building BennuGD Tools ###"

cd tools/moddesc
./configure
make clean
make
cd ../..

echo "### Copying files to bin folder ###"
TARGET=macosx
mkdir -p bin/$TARGET 2>/dev/null
cp core/bgdi/src/.libs/bgdi bin/$TARGET
cp core/bgdc/src/bgdc bin/$TARGET
cp core/bgdrtm/src/.libs/libbgdrtm.dylib bin/$TARGET
cp $(find modules -name '*.dylib') bin/$TARGET
cp tools/moddesc/moddesc bin/$TARGET
install_name_tool -change /usr/local/lib/libbgdrtm.dylib @executable_path/libbgdrtm.dylib bin/macosx/bgdi
find bin/macosx/*.dylib | xargs -n 1 -I{} install_name_tool -change /usr/local/lib/libbgdrtm.dylib @executable_path/libbgdrtm.dylib {}

echo "### Build done! ###"

exit 0
