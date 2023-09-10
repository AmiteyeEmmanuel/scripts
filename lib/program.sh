#!/usr/bin/bash

mem() {
   free -h | grep Mem
}

disk() {
   df -t btrfs
}

sys() {
   neofetch
}

while getopts 'abc' OPTION; do 
    case "$OPTION" in 
        a) 
            mem
            ;;
        b) 
            disk
            ;;
        c)
            sys
            ;;
        *)
            echo "Invalid option: -$OPTION" >&2
            exit 1
            ;;
    esac
done

