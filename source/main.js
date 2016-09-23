"use strict";

const fs = require("fs");
const https = require("https");

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
  let content = fs.readFileSync(path, "utf8");
  return content.length;
}

function getHttpContentLength(url) {
  return new Promise((resolve) => {
    https.get(url, (resp) => {
      let len = 0;
      resp.on("data", (buf) => {
        len += buf.length;
      });
      resp.on("end", () => {
        resolve(len);
      });
    });
  });
}

let sortArguments = (...args) => args.sort();

let arg = process.argv[2];
if (arg < 0) {
  console.error(`Negative number: ${arg}`);
  process.exit(1);
}

console.log(`fac(${arg}) = ${getFactorial(arg)}`);
console.log(`fib(${arg}) = ${getFibonacci(arg)}`);
console.log(`read() = ${getFileContentLength("data/file.txt")}`);
getHttpContentLength("https://example.com/").then((len) => {
  console.log(`get() = ${len}`);
});
console.log(`sort() = ${sortArguments("He", "l", "10", "W", "0", "r", "l", "d")}`);
