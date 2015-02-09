#!/usr/bin/env php

<?php
function fac($num) {
  if ($num < 2)
    return 1;
  
  return $num * fac($num - 1);
}

function fib($num) {
  if ($num < 3)
    return 1;
  
  return fib($num - 1) + fib($num - 2);
}

function read($path) {
  return strlen(file_get_contents($path));
}

$arg = $argv[1];
if ($arg < 0) {
  echo "Negative number: $arg\n";
  exit(1);
}

echo "fac($arg) = ".fac($arg)."\n";
echo "fib($arg) = ".fib($arg)."\n";
echo "read() = ".read("data/file.txt")."\n";
echo "get() = ".read("https://example.com/")."\n";
?>
