#!/usr/bin/env lua

function fac(num)
  if num < 2 then
    return 1
  end
  
  return num * fac(num - 1)
end

function fib(num)
  if num < 3 then
    return 1
  end
  
  return fib(num - 1) + fib(num - 2)
end

function read(path)
  local file = io.open(path, "r")
  local content = file:read("*all")
  file:close()
  return content:len()
end

function open(url)
  -- TODO: NYI
  return -1
end

local num = tonumber(arg[1])
if num < 0 then
  print("Negative number: "..num)
  os.exit(1)
end

print("fac("..num..") = "..fac(num))
print("fib("..num..") = "..fib(num))
print("read() = "..read("data/file.txt"))
print("open() = "..open("https://example.com/"))
