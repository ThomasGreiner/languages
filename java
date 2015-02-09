#!/bin/bash

mkdir -p tmp
javac -d tmp source/Main.java
mkdir -p bin
cd tmp
jar cvfe ../bin/java Main *.class > /dev/null
rm *.class
cd ..
chmod +x bin/java
./bin/java $1
