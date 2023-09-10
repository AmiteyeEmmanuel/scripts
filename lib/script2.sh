#!/bin/bash 

function multiplication() {
echo "Enter a numbers to multipy:"
read num1
read num2
read num3

echo `expr $num1 \* $num2 \* $num3`

}

multiplication
