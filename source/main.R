library(httr)

getFactorial <- function(num) {
  if (num < 2) {
    return(1)
  }
  
  return(num * getFactorial(num - 1))
}

getFibonacci <- function(num) {
  if (num < 3) {
    return(1)
  }
  
  return(getFibonacci(num - 1) + getFibonacci(num - 2))
}

getFileContentLength <- function(path) {
  return(file.info(path)$size)
}

getHttpContentLength <- function(url) {
  req <- GET(url)
  return(nchar(content(req, "text", encoding = "utf8")))
}

sortArguments <- function(...) {
  return(paste(sort(c(...)), collapse = ","))
}

args <- commandArgs(trailingOnly = TRUE)
arg <- as.integer(args[1])

# TODO: implement argument checks

cat("fac() =", getFactorial(arg), "\n")
cat("fib() =", getFibonacci(arg), "\n")
cat("read() =", getFileContentLength("data/file.txt"), "\n")
cat("get() =", getHttpContentLength("https://example.com/"), "\n")
cat("sort() =", sortArguments("He", "l", "10", "W", "0", "r", "l", "d"), "\n")
