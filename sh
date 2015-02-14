#!/bin/bash

fac() {
  if [[ $1 -lt 2 ]]
  then
    echo 1
    exit
  fi
  
  echo $(($1 * $(fac $(($1 - 1)))))
}

fib() {
  if [[ $1 -lt 3 ]]
  then
    echo 1
    exit
  fi
  
  local fib1=$(fib $(($1 - 1)))
  local fib2=$(fib $(($1 - 2)))
  echo $(($fib1 + $fib2))
}

read() {
  echo $(cat $1 | wc -m)
}

get() {
  echo $(curl -s $1 | wc -m)
}

if [[ $1 -lt 0 ]]
then
  echo "Negative number: $1"
  exit 1
fi

echo "fac($1) = $(fac $1)"
echo "fib($1) = $(fib $1)"
echo "read() = $(read 'data/file.txt')"
echo "get() = $(get 'https://example.com/')"
