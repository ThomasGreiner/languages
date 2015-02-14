import Network.HTTP
import System.Environment
import System.Exit

fac ::Integer -> Integer
fac(num)
  | num < 2 = 1
  | num >= 2 = num * fac(num - 1)

fib ::Integer -> Integer
fib(num)
  | num < 3 = 1
  | num >= 3 = fib(num - 1) + fib(num - 2)

readfile ::String -> IO Int
readfile(path) = do
  content <- readFile(path)
  return(length(content))

get ::String -> IO Int
get(url) = do
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
    putStrLn("fac() = " ++ show(fac(read(arg) :: Integer)))
    putStrLn("fib() = " ++ show(fib(read(arg) :: Integer)))
    len <- readfile("data/file.txt")
    putStrLn("read() = " ++ show(len))
    -- TODO: implement HTTPS request
    len <- get("http://example.com/")
    putStrLn("get() = " ++ show(len))
    exitWith(ExitSuccess)
