#!/usr/bin/bash

usage() {
    echo "Usage: $0 [-a] [-b] [-c <number>] [-d] [-h]"
    echo "Options:"
    echo "  -a    Perform function A"
    echo "  -b    Perform function B"
    echo "  -c    Perform function C with a number argument"
    echo "  -d    Perform function D with a function argument"
    echo "  -h    Display this help message"
    exit 1
}

function_a() {
    echo "Function A is performed."
    count=10 
    if [ $count -lt 10 ]; then
        echo "This condition is true"
    elif [ $count -eq 10 ]; then
        echo "Second condition is true"
    else 
        echo "This condition is false"
    fi
}

function_b() {
    echo "Function B is performed."
    user=$(whoami)
    date=$(date)
    wd=$(pwd)
    echo "You are currently logged in as $user"
    sleep 1
    echo "Your working directory $wd"
    sleep 2 
    echo "Today's date is $date"
}

function_c() {
    echo "Enter a number:"
    read num_c
    if [ $num_c -gt 0 ]; then
        echo "$num_c is positive"
    elif [ $num_c -lt 0 ]; then 
        echo "$num_c is negative"
    else 
        echo "$num_c is zero" 
    fi         
}

function_d() {
function contains_function() {
    local file="$1"
    local function_name="$2"
    grep -q "function $function_name" "$file"
}


# List all the functions in a file
function list_functions_in_file() {
    local file="$1"
    grep -E '^\s*function [a-zA-Z_][a-zA-Z0-9_]*\s*\(\)' "$file" | awk '{print $2}'
}

# Specify the directory to search for .sh files
directory_to_search="/home/nuwell/Documents/Examples/lib"

# Check if the directory exists
if [ ! -d "$directory_to_search" ]; then
    echo "Directory not found: $directory_to_search"
    exit 1
fi

# Search for .sh files in the directory
sh_files=$(find "$directory_to_search" -type f -name "*.sh")

# Loop through each .sh file and list functions
for file in $sh_files; do
    echo "Functions in $file:"
    while IFS= read -r -d $'\0' line; do
        function_name=$(basename "$line")
        function_name="${function_name%.*}"
        contains_function "$file" "$function_name"
        if [ $? -eq 0 ]; then
            echo "  $function_name"
        fi
    done < <(list_functions_in_file "$file")
done
}

while getopts "abcdh" opt; do
    case $opt in
        a)
            function_a
            ;;
        b)
            function_b
            ;;
        c)
            function_c
            ;;
        d)
            function_d
            ;;
        h)
            usage
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            usage
            ;;
        :)
            echo "Option -$OPTARG requires an argument." >&2
            usage
            ;;
    esac
done

# If no options are provided, display the usage message
if [ $OPTIND -eq 1 ]; then
    usage
fi

# Shift the parsed options out of the command-line arguments
shift $((OPTIND - 1))

