#!/bin/bash

function getInteger() {
if [ $# -ne 1 ]; then
    echo "Usage: $0 <integer>"
    exit 1
fi

# Check if the argument is a valid integer
if ! [[ "$1" =~ ^[0-9]+$ ]]; then
    echo "Error: Please provide a valid integer."
    exit 1
fi

# Double the provided integer
input_integer="$1"
result=$((input_integer * 2))

# Print the result
echo "The result of doubling $input_integer is: $result"

}

getInteger
