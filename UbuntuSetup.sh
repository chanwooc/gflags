#!/bin/bash


mkdir -p build
cd build

cmake -DCMAKE_TOOLCHAIN_FILE=arm-toolchain.cmake \
	-DCMAKE_BUILD_TYPE=Release \
	-DGFLAGS_NAMESPACE="google" \
	..

make
