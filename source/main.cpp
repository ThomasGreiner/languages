#include <iostream>
#include <fstream>
#include <sstream>
#include <streambuf>
#include <string>
#include <curl/curl.h>

using namespace std;

unsigned long getFactorial(int num) {
  if (num < 2) {
    return 1;
  }
  
  return num * getFactorial(num - 1);
}

unsigned long getFibonacci(int num) {
  if (num < 3) {
    return 1;
  }
  
  return getFibonacci(num - 1) + getFibonacci(num - 2);
}

unsigned long getFileContentLength(string path) {
  ifstream file(path.c_str());
  string content((istreambuf_iterator<char>(file)), istreambuf_iterator<char>());
  return content.length();
}

static size_t write_data(void *ptr, size_t size, size_t nmemb, void *stream) {
  int written = fwrite(ptr, size, nmemb, (FILE *)stream);
  return written;
}

// TODO: use memory instead of temporary file
// see http://curl.haxx.se/libcurl/c/getinmemory.html
unsigned long getHttpContentLength(string url) {
  CURL *curl;
  CURLcode resp;
  FILE *file;
  const string filename = "tmp/body.txt";
 
  curl = curl_easy_init();
  if (curl) {
    file = fopen(filename.c_str(), "wb");
    if (!file) {
      curl_easy_cleanup(curl);
      return 0;
    }
    
    curl_easy_setopt(curl, CURLOPT_URL, url.c_str());
    curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, write_data);
    curl_easy_setopt(curl, CURLOPT_WRITEDATA, file);
    resp = curl_easy_perform(curl);
    if (resp != CURLE_OK) {
      cerr << "libcurl: " << curl_easy_strerror(resp) << endl;
      curl_easy_cleanup(curl);
      return 0;
    }
    
    fclose(file);
    curl_easy_cleanup(curl);
    return getFileContentLength(filename);
  }
  return 0;
}

int main(int argc, char* argv[])
{
  istringstream ss(argv[1]);
  int arg;
  if (!(ss >> arg)) {
    cerr << "Invalid number: " << argv[1] << endl;
    return 1;
  }
  
  if (arg < 0) {
    cerr << "Negative number: " << arg << endl;
    return 1;
  }
  
  cout << "fac(" << arg << ") = " << getFactorial(arg) << endl;
  cout << "fib(" << arg << ") = " << getFibonacci(arg) << endl;
  cout << "read() = " << getFileContentLength("data/file.txt") << endl;
  cout << "get() = " << getHttpContentLength("https://example.com/") << endl;
  return 0;
}
