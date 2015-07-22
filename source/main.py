import sys, urllib2

def get_factorial(num):
  if num < 2:
    return 1
  
  return num * get_factorial(num - 1)

def get_fibonacci(num):
  if (num < 3):
    return 1
  
  return get_fibonacci(num - 1) + get_fibonacci(num - 2)

def get_file_content_length(path):
  content = open(path, "r").read()
  return len(content)

def get_http_content_length(url):
  content = urllib2.urlopen(url).read()
  return len(content)

arg = int(sys.argv[1])
if arg < 0:
  print "Negative number: %d" % arg
  exit(1)

print "fac(%d) = %d" % (arg, get_factorial(arg))
print "fib(%d) = %d" % (arg, get_fibonacci(arg))
print "read() = %s" % get_file_content_length("data/file.txt")
print "get() = %s" % get_http_content_length("https://example.com/")
