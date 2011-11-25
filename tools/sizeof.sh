#!/bin/bash

MODULE=$1
TYPE=$2

mkdir -p build
cd build

gdc -c ../main.d
cat ../sizeof.cpp | sed s/@MODULE@/$MODULE/g | sed s/@TYPE@/$TYPE/g > sizeof.cpp

g++ -c sizeof.cpp

gdc -o a.out sizeof.o main.o -L../../build/SFML/build/lib -L../../build/lib -L/usr/lib/gcc/x86_64-linux-gnu/4.6 -lsfml-system-s -ldsfml-system -lstdc++ && ./a.out

cd ..
rm -rf build

