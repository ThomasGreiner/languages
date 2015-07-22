get_factorial() {
  if [[ $1 -lt 2 ]]
  then
    echo 1
    exit
  fi
  
  echo $(($1 * $(get_factorial $(($1 - 1)))))
}

get_fibonacci() {
  if [[ $1 -lt 3 ]]
  then
    echo 1
    exit
  fi
  
  local fib1=$(get_fibonacci $(($1 - 1)))
  local fib2=$(get_fibonacci $(($1 - 2)))
  echo $(($fib1 + $fib2))
}

get_file_content_length() {
  echo $(cat $1 | wc -m)
}

get_http_content_length() {
  echo $(curl -s $1 | wc -m)
}

if [[ $1 -lt 0 ]]
then
  echo "Negative number: $1"
  exit 1
fi

echo "fac($1) = $(get_factorial $1)"
echo "fib($1) = $(get_fibonacci $1)"
echo "read() = $(get_file_content_length 'data/file.txt')"
echo "get() = $(get_http_content_length 'https://example.com/')"
