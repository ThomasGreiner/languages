using System;
using System.IO;
using System.Net;

class MainClass {
  private static long GetFaculty(long num) {
    if (num < 2) {
      return 1;
    }
    
    return num * GetFaculty(num - 1);
  }
  
  private static long GetFibonacci(long num) {
    if (num < 3) {
      return 1;
    }
    
    return GetFibonacci(num - 1) + GetFibonacci(num - 2);
  }
  
  private static long GetFileContentLength(string path) {
    string content = File.ReadAllText(path);
    return content.Length;
  }
  
  private static long GetHttpContentLength(string url) {
    // accept all certificates
    ServicePointManager.ServerCertificateValidationCallback += delegate {
      return true;
    };
    
    WebClient client = new WebClient();
    string content = client.DownloadString(url);
    return content.Length;
  }
  
  static void Main(string[] args) {
    long arg = Convert.ToInt64(args[0]);
    
    if (arg < 1) {
      throw new ArgumentException(string.Format("Negative number: {0}", arg));
    }
    
    Console.WriteLine("fac({0}) = {1}", arg, GetFaculty(arg));
    Console.WriteLine("bib({0}) = {1}", arg, GetFibonacci(arg));
    Console.WriteLine("read() = {0}", GetFileContentLength("data/file.txt"));
    Console.WriteLine("get() = {0}", GetHttpContentLength("https://www.example.com/"));
  }
}
