#!/bin/bash

mkdir -p tmp bin
pc -S2 -FUtmp -FEbin -opas source/main.pas > /dev/null 2> /dev/null
./bin/pas $1
