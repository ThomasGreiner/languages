'use strict'

fs = require 'fs'
https = require 'https'

getFactorial = (num) ->
  if num < 2 then 1 else num * getFactorial(num - 1)

getFibonacci = (num) ->
  if num < 3 then 1 else getFibonacci(num - 1) + getFibonacci(num - 2)

getFileContentLength = (path) ->
  content = fs.readFileSync path, 'utf8'
  content.length

getHttpContentLength = (url) ->
  new Promise (resolve) ->
    https.get url, (resp) ->
      len = 0
      resp.on 'data', (buf) -> len += buf.length
      resp.on 'end', () -> resolve(len)

sortArguments = (args...) -> args.sort()

arg = process.argv[2]
if arg < 0
  console.error "Negative number: #{arg}"
  process.exit 1

console.log "fac(#{arg}) = #{getFactorial(arg)}"
console.log "fib(#{arg}) = #{getFibonacci(arg)}"
console.log "read() = #{getFileContentLength('data/file.txt')}"
getHttpContentLength 'https://example.com/'
    .then (len) -> console.log "get() = #{len}"
console.log "sort() = #{sortArguments('He', 'l', '10', 'W', '0', 'r', 'l', 'd')}"
