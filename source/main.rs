extern crate hyper;

use hyper::Client;
use std::cmp::Ordering;
use std::env;
use std::fs::File;
use std::io::Read;
use std::process;

fn fac(num: isize) -> isize {
  let ord = num.cmp(&2);
  if ord == Ordering::Less {
    return 1;
  } else {
    return num * fac(num - 1);
  }
}

fn fib(num: isize) -> isize {
  let ord = num.cmp(&3);
  if ord == Ordering::Less {
    return 1;
  } else {
    return fib(num - 1) + fib(num - 2);
  }
}

fn read(path: &'static str) -> u64 {
  let file = match File::open(path) {
    Ok(file) => file,
    Err(err) => panic!("{}", err),
  };
  let metadata = match file.metadata() {
    Ok(metadata) => metadata,
    Err(err) => panic!("{}", err),
  };
  return metadata.len();
}

fn get(url: &'static str) -> usize {
  let mut client = Client::new();
  let mut response = match client.get(url).send() {
    Ok(response) => response,
    Err(err) => panic!("{}", err),
  };
  let mut content = String::new();
  response.read_to_string(&mut content).unwrap();
  return content.len();
}

fn main() {
  let args: Vec<String> = env::args().collect();
  let arg = match args[1].clone().parse::<isize>() {
    Ok(arg) => arg,
    Err(err) => panic!("{}", err),
  };
  
  let ord = arg.cmp(&0);
  if ord == Ordering::Less {
    println!("Negative number: {:?}", arg);
    process::exit(1);
  }
  
  println!("fac({0:?}) = {1:}", arg, fac(arg));
  println!("fib({0:?}) = {1:}", arg, fib(arg));
  println!("read() = {0:}", read("data/file.txt"));
  println!("get() = {0:}", get("https://example.com/"));
}
