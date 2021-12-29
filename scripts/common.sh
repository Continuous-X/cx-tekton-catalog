#!/bin/bash

function checkParam1() {
    if [ -z "$1" ]; then 
        echo "Param: $1"
        help
        exit 1
    fi
}
