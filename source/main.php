<?php
function get_factorial($num) {
  if ($num < 2)
    return 1;
  
  return $num * get_factorial($num - 1);
}

function get_fibonacci($num) {
  if ($num < 3)
    return 1;
  
  return get_fibonacci($num - 1) + get_fibonacci($num - 2);
}

function get_file_content_length($path) {
  return strlen(file_get_contents($path));
}

function sort_arguments() {
  $arr = func_get_args();
  asort($arr);
  return implode(",", $arr);
}

$arg = $argv[1];
if ($arg < 0) {
  echo "Negative number: $arg\n";
  exit(1);
}

echo "fac($arg) = ".get_factorial($arg)."\n";
echo "fib($arg) = ".get_fibonacci($arg)."\n";
echo "read() = ".get_file_content_length("data/file.txt")."\n";
echo "get() = ".get_file_content_length("https://example.com/")."\n";
echo "sort() = ".sort_arguments("He", "l", "10", "W", "0", "r", "l", "d")."\n";
?>
