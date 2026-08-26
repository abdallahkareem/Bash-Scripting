#!/bin/bash

function my_function() {
    echo "Hello from my_function!"
}
my_function

# Read from STDIN

for i in $(ls /etc)
  do
      echo $i
  done