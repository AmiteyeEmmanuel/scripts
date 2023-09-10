#!/bin/bash 

 mk_dir() {
echo "Enter a name:"
read new 
echo $(mkdir $new)
}

mk_dir

