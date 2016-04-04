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

echo "### Fixing dodgy linker ###"
install_name_tool -change /usr/local/lib/libbgdrtm.dylib @executable_path/libbgdrtm.dylib bin/macosx/bgdi
find bin/macosx/*.dylib | xargs -n 1 -I{} install_name_tool -change /usr/local/lib/libbgdrtm.dylib @executable_path/libbgdrtm.dylib {}
find bin/macosx/*.dylib | xargs -n 1 -I{} install_name_tool -change /usr/local/lib/librender.dylib @executable_path/librender.dylib {}
find bin/macosx/*.dylib | xargs -n 1 -I{} install_name_tool -change /usr/local/lib/libvideo.dylib @executable_path/libvideo.dylib {}
find bin/macosx/*.dylib | xargs -n 1 -I{} install_name_tool -change /usr/local/lib/libblit.dylib @executable_path/libblit.dylib {}
find bin/macosx/*.dylib | xargs -n 1 -I{} install_name_tool -change /usr/local/lib/libgrbase.dylib @executable_path/libgrbase.dylib {}
find bin/macosx/*.dylib | xargs -n 1 -I{} install_name_tool -change /usr/local/lib/libtext.dylib @executable_path/libtext.dylib {}
find bin/macosx/*.dylib | xargs -n 1 -I{} install_name_tool -change /usr/local/lib/libmap.dylib @executable_path/libmap.dylib {}
find bin/macosx/*.dylib | xargs -n 1 -I{} install_name_tool -change /usr/local/lib/libdraw.dylib @executable_path/libdraw.dylib {}
find bin/macosx/*.dylib | xargs -n 1 -I{} install_name_tool -change /usr/local/lib/libmath.dylib @executable_path/libmath.dylib {}
find bin/macosx/*.dylib | xargs -n 1 -I{} install_name_tool -change /usr/local/lib/libgrproc.dylib @executable_path/libgrproc.dylib {}
find bin/macosx/*.dylib | xargs -n 1 -I{} install_name_tool -change /usr/local/lib/libkey.dylib @executable_path/libkey.dylib {}
find bin/macosx/*.dylib | xargs -n 1 -I{} install_name_tool -change /usr/local/lib/libwm.dylib @executable_path/libwm.dylib {}
find bin/macosx/*.dylib | xargs -n 1 -I{} install_name_tool -change /usr/local/lib/libfont.dylib @executable_path/libfont.dylib {}
find bin/macosx/*.dylib | xargs -n 1 -I{} install_name_tool -change /usr/local/lib/libbgload.dylib @executable_path/libbgload.dylib {}


echo "### Build done! ###"

exit 0
