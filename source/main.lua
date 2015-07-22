#!/usr/bin/env lua

function get_faculty(num)
  if num < 2 then
    return 1
  end
  
  return num * get_faculty(num - 1)
end

function get_fibonacci(num)
  if num < 3 then
    return 1
  end
  
  return get_fibonacci(num - 1) + get_fibonacci(num - 2)
end

function get_file_content_length(path)
  local file = io.open(path, "r")
  local content = file:read("*all")
  file:close()
  return content:len()
end

function get_http_content_length(url)
  -- TODO: NYI
  return -1
end

local num = tonumber(arg[1])
if num < 0 then
  print("Negative number: "..num)
  os.exit(1)
end

print("fac("..num..") = "..get_faculty(num))
print("fib("..num..") = "..get_fibonacci(num))
print("read() = "..get_file_content_length("data/file.txt"))
print("open() = "..get_http_content_length("https://example.com/"))
