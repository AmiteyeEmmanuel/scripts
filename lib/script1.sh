#!/bin/bash 

function number_declaration() {
echo "Enter a number:"
read num 
if [ $num -lt 0 ];then 
echo  "$num is negative"
elif [ $num -gt 0 ];then 
	echo "$num is positve"
else 
	echo "$num is zero"
fi

}

number_declaration
