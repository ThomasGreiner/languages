import 'dart:convert';
import 'dart:io';

int getFactorial(int num) {
  if (num < 1)
    return 1;
  
  return num * getFactorial(num - 1);
}

int getFibonacci(int num) {
  if (num < 3)
    return 1;
  
  return getFibonacci(num - 1) + getFibonacci(num - 2);
}

int getFileContentLength(path) {
  String content = new File(path).readAsStringSync();
  return content.length;
}

int getHttpContentLength(url) async {
  HttpClient client = new HttpClient();
  HttpClientRequest req = await client.getUrl(Uri.parse(url));
  HttpClientResponse resp = await req.close();
  client.close();
  
  String content = await resp.transform(UTF8.decoder).join();
  return content.length;
}

void main(List<String> arguments) async {
  int arg = int.parse(arguments[0]);
  if (arg < 0) {
    print("Negative number: ${arg}");
    exit(1);
  }
  
  print("fac(${arg}) = ${getFactorial(arg)}");
  print("fib(${arg}) = ${getFibonacci(arg)}");
  print("read() = ${getFileContentLength('data/file.txt')}");
  print("get() = ${await getHttpContentLength('https://example.com/')}");
}
