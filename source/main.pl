use LWP::Simple;

sub get_factorial {
  my $num = $_[0];
  if ($num < 2) {
    return 1;
  }
  
  return $num * get_factorial($num - 1);
}

sub get_fibonacci {
  my $num = $_[0];
  if ($num < 3) {
    return 1;
  }
  
  return get_fibonacci($num - 1) + get_fibonacci($num - 2);
}

sub get_file_content_length {
  open(FILE, $_[0]) or return -1;
  my $content = do {
    local $/;
    <FILE>;
  };
  close(FILE);
  
  return length($content);
}

sub get_http_content_length {
  $content = get($_[0]) or return -1;
  return length($content);
}

$arg = $ARGV[0];
if ($arg < 0) {
  print "Negative number: $arg\n";
  exit 1;
}

print "fac($arg) = @{[get_factorial($arg)]}\n";
print "fib($arg) = @{[get_fibonacci($arg)]}\n";
print "read() = @{[get_file_content_length('data/file.txt')]}\n";
print "get() = @{[get_http_content_length('https://example.com/')]}\n";
