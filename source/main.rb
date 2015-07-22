require "net/http"

def get_factorial(num)
  if num < 2
    return 1
  end
  
  num * get_factorial(num - 1)
end

def get_fibonacci(num)
  if num < 3
    return 1
  end
  
  get_fibonacci(num - 1) + get_fibonacci(num - 2)
end

def get_file_content_length(path)
  File.read(path).length
end

def get_http_content_length(url)
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

puts "fac(#{arg}) = #{get_factorial(arg)}"
puts "fib(#{arg}) = #{get_fibonacci(arg)}"
puts "read() = #{get_file_content_length('data/file.txt')}"
puts "get() = #{get_http_content_length('https://example.com/')}"
