package main

import (
  "fmt"
  "net/http"
  "io/ioutil"
  "os"
  "strconv"
)

func getFaculty(num int) int {
  if (num < 2) {
    return 1
  }
  
  return num * getFaculty(num - 1)
}

func getFibonacci(num int) int {
  if (num < 3) {
    return 1
  }
  
  return getFibonacci(num - 1) + getFibonacci(num - 2)
}

func getFileContentLength(path string) int {
  content, _ := ioutil.ReadFile(path)
  return len(content)
}

func getHttpContentLength(url string) int {
  resp, _ := http.Get(url)
  defer resp.Body.Close()
  content, _ := ioutil.ReadAll(resp.Body)
  return len(content)
}

func main() {
  arg, _ := strconv.Atoi(os.Args[1])
  if arg < 0 {
    fmt.Printf("Negative number: %d\n", arg)
    os.Exit(1)
  }
  
  fmt.Printf("fac(%d) = %d\n", arg, getFaculty(arg))
  fmt.Printf("fib(%d) = %d\n", arg, getFibonacci(arg))
  fmt.Printf("read() = %d\n", getFileContentLength("data/file.txt"))
  fmt.Printf("get() = %d\n", getHttpContentLength("https://example.com/"))
}
