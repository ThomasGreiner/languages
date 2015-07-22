function getFactorial(num) {
  if (num < 2)
    return 1;
  
  return num * getFactorial(num - 1);
}

function getFibonacci(num) {
  if (num < 3)
    return 1;
  
  return getFibonacci(num - 1) + getFibonacci(num - 2);
}

function getFileContentLength(path) {
  var content = require("fs").readFileSync(path, "utf-8");
  return content.length;
}

function getHttpContentLength(url, callback) {
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

console.log("fac(%d) = %d", arg, getFactorial(arg));
console.log("fib(%d) = %d", arg, getFibonacci(arg));
console.log("read() = %d", getFileContentLength("data/file.txt"));
getHttpContentLength("https://example.com/", function(len) {
  console.log("get() = %d", len);
});
