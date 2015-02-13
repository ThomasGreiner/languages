program Main;
uses SysUtils, FpHttpClient;

function Fac(Num : Integer) : LongInt;
begin
  if Num < 2 then
  begin
    Exit(1);
  end;
  
  Exit(Num * Fac(Num - 1));
end;

function Fib(Num : Integer) : LongInt;
begin
  if Num < 3 then
  begin
    Exit(1);
  end;
  
  Exit(Fib(Num - 1) + Fib(Num - 2));
end;

function Read(Path : String) : LongInt;
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

function Get(Url : String) : LongInt;
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
  
  WriteLn('fac(', Arg, ') = ', Fac(Arg));
  WriteLn('fib(', Arg, ') = ', Fib(Arg));
  WriteLn('read() = ', Read('data/file.txt'));
  WriteLn('get() = ', Get('http://example.com/'));
end.
