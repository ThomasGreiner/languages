import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.io.Reader;
import java.net.HttpURLConnection;
import java.net.URL;

public class Main {
  private static final String NL = System.getProperty("line.separator");
  
  private static int getContentLength(Reader input)
  throws IOException {
    StringBuilder content = new StringBuilder();
    BufferedReader reader = new BufferedReader(input);
    String line = null;
    try {
      while ((line = reader.readLine()) != null) {
        content.append(line);
        content.append(NL);
      }
    } finally {
      reader.close();
    }
    return content.toString().length();
  }
  
  private static long getFactorial(long num) {
    if (num < 2) {
      return 1;
    }
    
    return num * getFactorial(num - 1);
  }
  
  private static long getFibonacci(long num) {
    if (num < 3) {
      return 1;
    }
    
    return getFibonacci(num - 1) + getFibonacci(num - 2);
  }
  
  private static long getFileContentLength(String path) {
    try {
      File file = new File(path);
      FileReader reader = new FileReader(file);
      return getContentLength(reader);
    } catch(IOException ex) {
      ex.printStackTrace();
      return -1;
    }
  }
  
  private static long getHttpContentLength(String urlString) {
    try {
      URL url = new URL(urlString);
      HttpURLConnection conn = (HttpURLConnection)url.openConnection();
      conn.setRequestMethod("GET");
      InputStreamReader reader = new InputStreamReader(conn.getInputStream());
      return getContentLength(reader);
    } catch(IOException ex) {
      ex.printStackTrace();
      return -1;
    }
  }
  
  public static void main(String[] args)
  throws IllegalArgumentException {
    long arg = Long.parseLong(args[0]);
    
    if (arg < 0) {
      throw new IllegalArgumentException("Negative number: " + arg);
    }
    
    System.out.println("fac(" + arg + ") = " + getFactorial(arg));
    System.out.println("fib(" + arg + ") = " + getFibonacci(arg));
    System.out.println("read() = " + getFileContentLength("data/file.txt"));
    System.out.println("get() = " + getHttpContentLength("https://example.com/"));
  }
}
