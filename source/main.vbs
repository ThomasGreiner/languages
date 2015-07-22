Dim arg

Function GetFaculty(num)
  If num < 2 Then
    GetFaculty = 1
    Exit Function
  End If
  
  GetFaculty = num * GetFaculty(num - 1)
End Function

Function GetFibonacci(num)
  If num < 3 Then
    GetFibonacci = 1
    Exit Function
  End If
  
  GetFibonacci = GetFibonacci(num - 1) + GetFibonacci(num - 2)
End Function

Function GetFileContentLength(path)
  Dim fso, file
  Set fso = CreateObject("Scripting.FileSystemObject")
  Set file = fso.OpenTextFile(path, 1)
  GetFileContentLength = Len(file.ReadAll())
  file.Close()
End Function

Function GetHttpContentLength(url)
  Dim xhr
  Set xhr = CreateObject("MSXML2.XMLHTTP")
  xhr.Open "GET", url, false
  xhr.Send()
  GetHttpContentLength = Len(xhr.ResponseText)
End Function

arg = WScript.Arguments.Item(0)
If arg < 0 Then
  WScript.Echo("Negative number: " & arg)
  WScript.Quit(1) ' echo %errorlevel%
End If

Wscript.Echo("Fac(" & arg & ") = " & GetFaculty(arg))
Wscript.Echo("Fib(" & arg & ") = " & GetFibonacci(arg))
Wscript.Echo("Read() = " & GetFileContentLength("data/file.txt"))
Wscript.Echo("Open() = " & GetHttpContentLength("https://example.com/"))
