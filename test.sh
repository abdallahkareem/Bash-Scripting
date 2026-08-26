#!/bin/bash

read -p "Enter a number:" i

if ((i % 2 == 0)); then
    echo "The number is even"
    else
    echo "The number is odd"
fi