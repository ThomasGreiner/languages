#!/bin/bash

mkdir -p bin tmp
ghc source/main.hs -odir tmp -hidir tmp -o bin/hs
./bin/hs $1
