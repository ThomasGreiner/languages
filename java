#!/bin/bash

mkdir -p tmp
javac -d tmp source/Main.java
cd tmp
mkdir -p bin
jar cvfe ../bin/java Main *.class > /dev/null
rm *.class
cd ..
chmod +x bin/java
./bin/java $1
