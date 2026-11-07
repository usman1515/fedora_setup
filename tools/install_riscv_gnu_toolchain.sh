#!/bin/bash

# URL: https://github.com/riscv-collab/riscv-gnu-toolchain


# create dir Tools if it doesnt exist
[ -d ~/Tools ] || mkdir -p ~/Tools
cd ~/Tools

# dependencies
sudo dnf install -y autoconf automake python3 libmpc-devel mpfr-devel gmp-devel gawk bison \
    flex texinfo patchutils gcc gcc-c++ zlib-devel expat-devel libslirp-devel ncurses-devel \
    meson ninja-build cmake dtc

# clone the repo
git clone https://github.com/riscv/riscv-gnu-toolchain riscv_gnu_toolchain
cd riscv_gnu_toolchain

# installation linux
./configure --prefix=/opt/riscv --with-arch=rv32gc --with-abi=ilp32d --enable-multilib --disable-linux

# build
sudo make -j$(nproc)

# inspect what multilib configurations were built with
riscv32-unknown-elf-gcc --print-multi-lib
riscv64-unknown-elf-gcc --print-multi-lib
