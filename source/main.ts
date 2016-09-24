/// <reference path="../lib/typings/node/node.d.ts" />
/// <reference path="../lib/typings/es6-promise/es6-promise.d.ts" />

"use strict";

import * as fs from "fs";
import * as https from "https";

function getFactorial(num: number): number {
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
  let content = fs.readFileSync(path, "utf8");
  return content.length;
}

function getHttpContentLength(url: string): Promise<number> {
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

let sortArguments = (...args: string[]): string[] => args.sort();

let arg = parseInt(process.argv[2], 10);
if (arg < 0) {
  console.error(`Negative number: ${arg}`);
  process.exit(1);
}

console.log(`fac(${arg}) = ${getFactorial(arg)}`);
console.log(`fib(${arg}) = ${getFibonacci(arg)}`);
console.log(`read() = ${getFileContentLength("data/file.txt")}`);
getHttpContentLength("https://example.com/").then((len: number) => {
  console.log(`get() = ${len}`);
});
console.log(`sort() = ${sortArguments("He", "l", "10", "W", "0", "r", "l", "d")}`);
