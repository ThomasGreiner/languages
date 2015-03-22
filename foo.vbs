Dim arg

Function fac(num)
  If num < 2 Then
    fac = 1
    Exit Function
  End If
  
  fac = num * fac(num - 1)
End Function

Function fib(num)
  If num < 3 Then
    fib = 1
    Exit Function
  End If
  
  fib = fib(num - 1) + fib(num - 2)
End Function

Function read(path)
  read = -1
End Function

Function open(url)
  open = -1
End Function

arg = WScript.Arguments.Item(0)
If arg < 0 Then
  WScript.Echo("Negative number: " & arg)
  WScript.Quit(1) ' echo %errorlevel%
End If

Wscript.Echo("fac(" & arg & ") = " & fac(arg))
Wscript.Echo("fib(" & arg & ") = " & fib(arg))
Wscript.Echo("read() = " & read("data/file.txt"))
Wscript.Echo("open() = " & open("https://example.com/"))
