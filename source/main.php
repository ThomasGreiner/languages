<?php
function get_faculty($num) {
  if ($num < 2)
    return 1;
  
  return $num * get_faculty($num - 1);
}

function get_fibonacci($num) {
  if ($num < 3)
    return 1;
  
  return get_fibonacci($num - 1) + get_fibonacci($num - 2);
}

function get_file_content_length($path) {
  return strlen(file_get_contents($path));
}

$arg = $argv[1];
if ($arg < 0) {
  echo "Negative number: $arg\n";
  exit(1);
}

echo "fac($arg) = ".get_faculty($arg)."\n";
echo "fib($arg) = ".get_fibonacci($arg)."\n";
echo "read() = ".get_file_content_length("data/file.txt")."\n";
echo "get() = ".get_file_content_length("https://example.com/")."\n";
?>
