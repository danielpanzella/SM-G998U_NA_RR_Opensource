#!/bin/bash

PATH=${PWD}/aosp-gcc/bin:${PWD}/aosp-clang/bin:${PATH}
ARCH=arm64
SUBARCH=arm64

pushd Kernel
rm -rf out
mkdir out

make -j$(nproc --all) -C $(pwd) O=$(pwd)/out DTC_EXT=$(pwd)/tools/dtc CONFIG_BUILD_ARM64_DT_OVERLAY=y CC=clang CLANG_TRIPLE=aarch64-linux-gnu- CROSS_COMPILE=aarch64-linux-android- vendor/p3q_usa_singlew_defconfig
make -j$(nproc --all) -C $(pwd) O=$(pwd)/out DTC_EXT=$(pwd)/tools/dtc CONFIG_BUILD_ARM64_DT_OVERLAY=y CC=clang CLANG_TRIPLE=aarch64-linux-gnu- CROSS_COMPILE=aarch64-linux-android-