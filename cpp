#!/bin/bash

mkdir -p bin
g++ source/main.cpp -o bin/cpp -lcurl
mkdir -p tmp
./bin/cpp $1
