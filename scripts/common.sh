#!/bin/bash

function checkParam1() {
    echo "checkint param 1: $1"
    if [ -z "$1" ]; then 
        help
        exit 1
    fi
}

function checkParam2() {
    echo "checking param 2: $2"
    if [ -z "$2" ]; then 
        help
        exit 1
    fi
}
