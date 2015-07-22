import Network.HTTP
import System.Environment
import System.Exit

getFaculty ::Integer -> Integer
getFaculty(num)
  | num < 2 = 1
  | num >= 2 = num * getFaculty(num - 1)

getFibonacci ::Integer -> Integer
getFibonacci(num)
  | num < 3 = 1
  | num >= 3 = getFibonacci(num - 1) + getFibonacci(num - 2)

getFileContentLength ::String -> IO Int
getFileContentLength(path) = do
  content <- readFile(path)
  return(length(content))

getHttpContentLength ::String -> IO Int
getHttpContentLength(url) = do
  req <- simpleHTTP(getRequest(url))
  content <- getResponseBody(req)
  return(length(content))

main ::IO ExitCode
main = do
  [arg] <- getArgs
  if (read(arg) :: Integer) < 0
  then do
    putStrLn("Negative number: " ++ arg)
    exitWith(ExitFailure(1))
  else do
    putStrLn("fac() = " ++ show(getFaculty(read(arg) :: Integer)))
    putStrLn("fib() = " ++ show(getFibonacci(read(arg) :: Integer)))
    len <- getFileContentLength("data/file.txt")
    putStrLn("read() = " ++ show(len))
    -- TODO: implement HTTPS request
    len <- getHttpContentLength("http://example.com/")
    putStrLn("get() = " ++ show(len))
    exitWith(ExitSuccess)
