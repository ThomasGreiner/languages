using System;
using System.IO;
using System.Net;

class MainClass {
  private static long Fac(long num) {
    if (num < 2) {
      return 1;
    }
    
    return num * Fac(num - 1);
  }
  
  private static long Fib(long num) {
    if (num < 3) {
      return 1;
    }
    
    return Fib(num - 1) + Fib(num - 2);
  }
  
  private static long Read(string path) {
    string content = File.ReadAllText(path);
    return content.Length;
  }
  
  private static long Get(string url) {
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
    
    Console.WriteLine("Fac({0}) = {1}", arg, Fac(arg));
    Console.WriteLine("Fib({0}) = {1}", arg, Fib(arg));
    Console.WriteLine("Read() = {0}", Read("data/file.txt"));
    Console.WriteLine("Get() = {0}", Get("https://www.example.com/"));
  }
}
