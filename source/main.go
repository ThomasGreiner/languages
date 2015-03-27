package main

import (
  "fmt"
  "net/http"
  "io/ioutil"
  "os"
  "strconv"
)

func fac(num int) int {
  if (num < 2) {
    return 1
  }
  
  return num * fac(num - 1)
}

func fib(num int) int {
  if (num < 3) {
    return 1
  }
  
  return fib(num - 1) + fib(num - 2)
}

func read(path string) int {
  content, _ := ioutil.ReadFile(path)
  return len(content)
}

func get(url string) int {
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
  
  fmt.Printf("fac(%d) = %d\n", arg, fac(arg))
  fmt.Printf("fib(%d) = %d\n", arg, fib(arg))
  fmt.Printf("read() = %d\n", read("data/file.txt"))
  fmt.Printf("get() = %d\n", get("https://example.com/"))
}
