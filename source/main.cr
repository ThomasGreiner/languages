require "http/client"

def get_factorial(num : Number)
  if num < 2
    return 1
  end
  
  num * get_factorial(num - 1)
end

def get_fibonacci(num : Number)
  if num < 3
    return 1
  end
  
  get_fibonacci(num - 1) + get_fibonacci(num - 2)
end

def get_file_content_length(path : String)
  File.read(path).size
end

def get_http_content_length(url : String)
  resp = HTTP::Client.get url
  resp.body.size
end

arg = ARGV[0].to_i
if arg < 0
  puts "Negative number: #{arg}"
  exit 1
end

puts "fac(#{arg}) = #{get_factorial(arg)}"
puts "fib(#{arg}) = #{get_fibonacci(arg)}"
puts "read() = #{get_file_content_length("data/file.txt")}"
puts "get() = #{get_http_content_length("https://example.com/")}"

