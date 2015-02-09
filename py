#!/usr/bin/env python

import sys, urllib2

def fac(num):
  if num < 2:
    return 1
  
  return num * fac(num - 1)

def fib(num):
  if (num < 3):
    return 1
  
  return fib(num - 1) + fib(num - 2)

def read(path):
  content = open(path, "r").read()
  return len(content)

def get(url):
  content = urllib2.urlopen(url).read()
  return len(content)

arg = int(sys.argv[1])
if arg < 0:
  print "Negative number: %d" % arg
  exit(1)

print "fac(%d) = %d" % (arg, fac(arg))
print "fib(%d) = %d" % (arg, fib(arg))
print "read() = %s" % read("data/file.txt")
print "get() = %s" % get("https://example.com/")
