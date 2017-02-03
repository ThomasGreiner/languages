import Foundation

func getFactorial(num: Int) -> Int {
  if (num < 2) {
    return 1
  }
  
  return num * getFactorial(num: num - 1)
}

func getFibonacci(num: Int) -> Int {
  if (num < 3) {
    return 1
  }
  
  return getFibonacci(num: num - 1) + getFibonacci(num: num - 2)
}

func getFileContentLength(path: String) throws -> Int {
  let content = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
  return content.characters.count
}

func getHttpContentLength(urlString: String) throws -> Int {
  let url = URL(string: urlString)
  let content = try String(contentsOf: url!, encoding: String.Encoding.utf8)
  return content.characters.count
}

func sortArguments(args: String...) -> String {
  return args.sorted().joined(separator: ",")
}

let arg: Int! = Int(CommandLine.arguments[1])!

if (arg < 0) {
  fputs("Negative number: \(arg)\n", stderr)
  exit(EXIT_FAILURE)
}

print("fac(\(arg!)) = \(getFactorial(num: arg))")
print("fib(\(arg!)) = \(getFibonacci(num: arg))")
print("read() = \(try getFileContentLength(path: "data/file.txt"))")
print("get() = \(try getHttpContentLength(urlString: "https://example.com/"))")
print("sort() = \(sortArguments(args: "He", "l", "10", "W", "0", "r", "l", "d"))")
