#!/bin/bash

ucfirst() {
	[ $# -eq 1 ] || return 1;
	echo ${1^};
	return 0;
}

MODULE=`ucfirst $1`
TYPE=$2

mkdir -p build
cd build

if [ ! -f main.o ]
then
	gdc -c ../main.d
fi

cat ../sizeof.cpp | sed s/@MODULE@/$MODULE/g | sed s/@TYPE@/$TYPE/g > sizeof.cpp

g++ -c sizeof.cpp

gdc -o a.out sizeof.o main.o -L../../build/SFML/build/lib -L../../build/lib -L/usr/lib/gcc/x86_64-linux-gnu/4.6 -lsfml-system-s -lstdc++
SIZE=`./a.out`

cd ..

if [ ! -f ../build/src/dsfml/sizes.d ]
then
	mkdir -p ../build/src/dsfml
	echo 'module dsfml.sizes;' > ../build/src/dsfml/sizes.d
	echo '' >> ../build/src/dsfml/sizes.d
fi

lcfirst() {
	[ $# -eq 1 ] || return 1;
	echo ${1,};
	return 0;
}

echo $TYPE size is $SIZE
echo 'immutable '`lcfirst $TYPE`'Size = '$SIZE';' >> ../build/src/dsfml/sizes.d

