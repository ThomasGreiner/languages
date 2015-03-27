Dim arg

Function Fac(num)
  If num < 2 Then
    Fac = 1
    Exit Function
  End If
  
  Fac = num * Fac(num - 1)
End Function

Function Fib(num)
  If num < 3 Then
    Fib = 1
    Exit Function
  End If
  
  Fib = Fib(num - 1) + Fib(num - 2)
End Function

Function Read(path)
  Dim fso, file
  Set fso = CreateObject("Scripting.FileSystemObject")
  Set file = fso.OpenTextFile(path, 1)
  Read = Len(file.ReadAll())
  file.Close()
End Function

Function Open(url)
  Dim xhr
  Set xhr = CreateObject("MSXML2.XMLHTTP")
  xhr.Open "GET", url, false
  xhr.Send()
  Open = Len(xhr.ResponseText)
End Function

arg = WScript.Arguments.Item(0)
If arg < 0 Then
  WScript.Echo("Negative number: " & arg)
  WScript.Quit(1) ' echo %errorlevel%
End If

Wscript.Echo("Fac(" & arg & ") = " & Fac(arg))
Wscript.Echo("Fib(" & arg & ") = " & Fib(arg))
Wscript.Echo("Read() = " & Read("data/file.txt"))
Wscript.Echo("Open() = " & Open("https://example.com/"))
