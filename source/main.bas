DIM Arg AS LONG
Arg = VAL(COMMAND$)

FUNCTION GetFactorial(Num AS LONG) AS LONG
  IF Num < 2 THEN
    GetFactorial = INT(1)
  ELSE
    GetFactorial = Num * GetFactorial(Num - 1)
  END IF
END FUNCTION

FUNCTION GetFibonacci(Num AS LONG) AS LONG
  IF NUM < 3 THEN
    Fib = INT(1)
  ELSE
    Fib = GetFibonacci(Num - 1) + GetFibonacci(Num - 2)
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

' TODO: implement argument checks

PRINT "fac(" + LTRIM$(STR$(Arg)) + ") ="; GetFactorial(Arg)
PRINT "fib(" + LTRIM$(STR$(Arg)) + ") ="; GetFibonacci(Arg)
PRINT "read() ="; GetFileContentLength("data/file.txt")
