#!/bin/bash

if [ -z "$NDK" ]; then
	echo "set up \$NDK PATH" >&2
	exit 1
fi

CMAKE_TOOLCHAIN_FILE=/home/cwchung/workspace/android-cmake/android.toolchain.cmake
mkdir -p build
cd build

cmake -DCMAKE_TOOLCHAIN_FILE=$CMAKE_TOOLCHAIN_FILE \
	-DANDROID_NDK=$NDK \
	-DCMAKE_BUILD_TYPE=Release \
	-DANDROID_ABI="armeabi-v7a with NEON" \
	-DANDROID_NATIVE_API_LEVEL=18 \
	-DANDROID_TOOLCHAIN_NAME="arm-linux-androideabi-4.8" \
	-DANDROID_STL="gnustl_static" \
	-DGFLAGS_NAMESPACE="google" \
	..


make
