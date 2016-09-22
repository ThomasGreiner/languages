/// <reference path="../tmp/typings/node/node.d.ts" />

function getFactorial(num: number) {
  if (num < 2)
    return 1;
  
  return num * getFactorial(num - 1);
}

function getFibonacci(num: number): number {
  if (num < 3)
    return 1;
  
  return getFibonacci(num - 1) + getFibonacci(num - 2);
}

function getFileContentLength(path: string): number {
  var content = require("fs").readFileSync(path, "utf-8");
  return content.length;
}

function getHttpContentLength(url: string, callback: Function): void {
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

var arg = parseInt(process.argv[2], 10);
if (arg < 0) {
  console.error("Negative number: %s", arg);
  process.exit(1);
}

// TODO: read user input
console.log("fac(%d) = %d", arg, getFactorial(arg));
console.log("fib(%d) = %d", arg, getFibonacci(arg));
console.log("read() = %d", getFileContentLength("data/file.txt"));
getHttpContentLength("https://example.com/", function(len) {
  console.log("get() = %d", len);
});
