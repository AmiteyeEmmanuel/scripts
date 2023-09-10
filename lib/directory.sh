#!/usr/bin/bash

function test_directory() {
    found_other_directory=false

    if [ -e ../lib ]; then
        echo "The 'lib' directory exists"
    else
        echo "The 'lib' directory does not exist"
    fi

    # Check for other directories
    for dir in ../src ../docs; do
        if [ -e "$dir" ]; then
            found_other_directory=true
            echo "Directory '$dir' exists"
        fi
    done

    if [ "$found_other_directory" = false ]; then
        echo "No other directories apart from 'lib' exist"
    fi
}

test_directory

