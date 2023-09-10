#!/bin/bash

day_of_week=$(date +%u)

getdays() {
case "$day_of_week" in
    1)
        echo "Hello, John!"
        ;;
    2)
        echo "Hello, Alice!"
        ;;
    3)
        echo "Hello, Bob!"
        ;;
    4)
        echo "Hello, Carol!"
        ;;
    5)
        echo "Hello, Dave!"
        ;;
    6)
        echo "Hello, Emma!"
        ;;
    7)
        echo "Hello, Frank!"
        ;;
    *)
        echo "Hello, World!"
        ;;
esac

}

getdays
