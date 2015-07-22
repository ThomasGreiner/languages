program Main;
uses SysUtils, FpHttpClient;

function GetFaculty(Num : Integer) : LongInt;
begin
  if Num < 2 then
  begin
    Exit(1);
  end;
  
  Exit(Num * GetFaculty(Num - 1));
end;

function GetFibonacci(Num : Integer) : LongInt;
begin
  if Num < 3 then
  begin
    Exit(1);
  end;
  
  Exit(GetFibonacci(Num - 1) + GetFibonacci(Num - 2));
end;

function GetFileContentLength(Path : String) : LongInt;
var F : TextFile;
    Line : String;
    Len : LongInt;
begin
  Assign(F, Path);
  Reset(F);
  Len := 0;
  try
    repeat
      ReadLn(F, Line);
      Len := Len + Length(Line) + 1;
    until Eof(F);
  finally
    Close(F);
  end;
  Exit(Len);
end;

function GetHttpContentLength(Url : String) : LongInt;
var Content : UnicodeString;
begin
  with TFPHttpClient.Create(Nil) do
  begin
    try
      Content := Get(Url);
    finally
      Free;
    end;
  end;
  Exit(Length(Content));
end;

var Arg : Integer;
begin
  Arg := StrToInt(ParamStr(1));
  if Arg < 0 then
  begin
    WriteLn('Negative number: ', Arg);
    Halt(1);
  end;
  
  WriteLn('fac(', Arg, ') = ', GetFaculty(Arg));
  WriteLn('fib(', Arg, ') = ', GetFibonacci(Arg));
  WriteLn('read() = ', GetFileContentLength('data/file.txt'));
  // TODO: implement HTTPS request
  WriteLn('get() = ', GetHttpContentLength('http://example.com/'));
end.
