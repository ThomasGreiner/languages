DIM Arg AS LONG
Arg = VAL(COMMAND$)

FUNCTION Fac(Num AS LONG) AS LONG
  IF Num < 2 THEN
    Fac = INT(1)
  ELSE
    Fac = Num * Fac(Num - 1)
  END IF
END FUNCTION

FUNCTION Fib(Num AS LONG) AS LONG
  IF NUM < 3 THEN
    Fib = INT(1)
  ELSE
    Fib = Fib(Num - 1) + Fib(Num - 2)
  END IF
END FUNCTION

FUNCTION GetFileContentLength(Path AS STRING) AS LONG
  DIM LineText AS STRING
  DIM Length AS LONG
  Length = 0

  OPEN Path FOR INPUT AS #1
  WHILE NOT EOF(1)
    INPUT #1, LineText
    Length = Length + LEN(LineText)
  WEND
  CLOSE #1
  
  GetFileContentLength = Length
END FUNCTION

PRINT "fac(" + LTRIM$(STR$(Arg)) + ") ="; Fac(Arg)
PRINT "fib(" + LTRIM$(STR$(Arg)) + ") ="; Fib(Arg)
PRINT "read() ="; GetFileContentLength("data/file.txt")
