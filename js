#!/usr/bin/env node

function fac(num) {
  if (num < 2)
    return 1;
  
  return num * fac(num - 1);
}

function fib(num) {
  if (num < 3)
    return 1;
  
  return fib(num - 1) + fib(num - 2);
}

function read(path) {
  var content = require("fs").readFileSync(path, "utf-8");
  return content.length;
}

function get(url, callback) {
  require("https").get(url, function(resp) {
    var len = 0;
    resp.on("data", function(buf) {
      len += buf.length;
    });
    resp.on("end", function() {
      callback(len);
    });
  });
}

var arg = process.argv[2];
if (arg < 0) {
  console.error("Negative number: %s", arg);
  process.exit(1);
}

console.log("fac(%d) = %d", arg, fac(arg));
console.log("fib(%d) = %d", arg, fib(arg));
console.log("read() = %d", read("data/file.txt"));
get("https://example.com/", function(len) {
  console.log("get() = %d", len);
});
