#!/bin/bash

mkdir -p build
cd build

if [ -d SFML ]
then
	cd SFML
	git reset --hard HEAD
	git pull
	cd ..
else
	git clone git://github.com/deadalnix/SFML.git
fi

patch -p0 < ../patches/thread.patch
patch -p0 < ../patches/cmake.patch

cd SFML
cd src/SFML/System
if [ -e D ]
then
	rm -f D
fi
ln -s ../../../../../patches/SFML/System/D D
cd ../../..

mkdir -p build
cd build

cmake .. && make

cd ../..

cmake .. && make

