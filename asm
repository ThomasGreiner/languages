#!/bin/bash

mkdir -p tmp
nasm -f elf64 -o tmp/main.o source/main.asm
gcc -o bin/asm tmp/main.o
./bin/asm $1
