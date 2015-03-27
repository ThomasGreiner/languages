#!/bin/bash

mkdir -p bin
mcs -out:bin/cs source/main.cs
bin/cs $1
