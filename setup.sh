#!/bin/bash

wget https://android.googlesource.com/platform/prebuilts/clang/host/linux-x86/+archive/android-11.0.0_r40/clang-r383902b1.tar.gz
git clone https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9 aosp-gcc

mkdir aosp-clang
tar -C aosp-clang/ -xzf clang-r383902b1.tar.gz

rm clang-r383902b1.tar.gz
