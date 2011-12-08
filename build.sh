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
if [ ! -e D ]
then
	ln -s ../../../../../patches/SFML/System/D D
fi
cd ../../..

mkdir -p build
cd build

cmake .. && make
cd ../..

# SFML compiled, now process D files to fill C++ object size.
cd ../tools
rm -rf ../build/src
find ../src -type f | grep '\.cpp$' | grep -v 'Sleep\.cpp$' | sed 's/.*\/\([a-z]*\)\/\([A-Z][a-zA-Z]*\)\.cpp$/.\/sizeof.sh \1 \2/g' | /bin/sh
rm -rf build

cd ../build
cmake .. && make

