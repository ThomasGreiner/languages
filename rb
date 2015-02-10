#!/usr/bin/env ruby

require "net/http"

def fac(num)
  if num < 2
    return 1
  end
  
  num * fac(num - 1)
end

def fib(num)
  if num < 3
    return 1
  end
  
  fib(num - 1) + fib(num - 2)
end

def read(path)
  File.read(path).length
end

def get(url)
  url = URI.parse(url)
  req = Net::HTTP::Get.new(url.request_uri)
  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  http.request(req).body.length
end

arg = ARGV[0].to_i
if arg < 0
  puts "Negative number: #{arg}"
  exit 1
end

puts "fac(#{arg}) = #{fac(arg)}"
puts "fib(#{arg}) = #{fib(arg)}"
puts "read() = #{read('data/file.txt')}"
puts "get() = #{get('https://example.com/')}"
