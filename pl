#!/usr/bin/env perl

use LWP::Simple;

sub Fac {
  my $num = $_[0];
  if ($num < 2) {
    return 1;
  }
  
  return $num * Fac($num - 1);
}

sub Fib {
  my $num = $_[0];
  if ($num < 3) {
    return 1;
  }
  
  return Fib($num - 1) + Fib($num - 2);
}

sub Read {
  open(FILE, $_[0]) or return -1;
  my $content = do {
    local $/;
    <FILE>;
  };
  close(FILE);
  
  return length($content);
}

sub Get {
  $content = get($_[0]) or return -1;
  return length($content);
}

$arg = $ARGV[0];
if ($arg < 0) {
  print "Negative number: $arg\n";
  exit 1;
}

print "fac($arg) = @{[Fac($arg)]}\n";
print "fib($arg) = @{[Fib($arg)]}\n";
print "read() = @{[Read('data/file.txt')]}\n";
print "get() = @{[Get('https://example.com/')]}\n";
