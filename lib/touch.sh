#!/bin/bash


mk_file() {

echo "Enter the name of the file:"
read filename
echo $(touch $filename)
}

mk_file
