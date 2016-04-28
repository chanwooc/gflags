#!/bin/bash

if [ -z "$NDK" ]; then
	echo "set up \$NDK PATH" >&2
	exit 1
fi

BASEDIR=$(cd $(dirname $0); pwd -P)
CMAKE_TOOLCHAIN_DIR=$BASEDIR/android-cmake

if [ ! -d $CMAKE_TOOLCHAIN_DIR ]; then
	( git clone https://github.com/cwchung90/android-cmake; )
fi


mkdir -p build
cd build

cmake -DCMAKE_TOOLCHAIN_FILE=$CMAKE_TOOLCHAIN_DIR/android.toolchain.cmake \
	-DANDROID_NDK=$NDK \
	-DCMAKE_BUILD_TYPE=Release \
	-DANDROID_ABI="armeabi-v7a with NEON" \
	-DANDROID_NATIVE_API_LEVEL=16 \
	-DANDROID_TOOLCHAIN_NAME="arm-linux-androideabi-4.8" \
	-DANDROID_STL="gnustl_static" \
	-DGFLAGS_NAMESPACE="google" \
	..

make
