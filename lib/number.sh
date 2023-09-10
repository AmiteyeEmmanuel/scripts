#!/bin/bash 

count=10

if (( $count <= 9 )) 
then 
	echo "This condition is true"
elif (( $count < 2 ))
then 
	echo "Second Condition is true"
else  	
	echo "This condition is false"
fi
