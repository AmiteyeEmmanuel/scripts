#!/bin/bash

number() {
echo "Enter two numbers to add:"

read num1
read num2

echo `expr $num1 + $num2`

}

number
