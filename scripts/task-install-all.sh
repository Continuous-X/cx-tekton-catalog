#!/bin/bash

#set -x

NAMESPACE=$1
scriptname=$(basename "$0")
basepath=$(cd $(dirname "$0") && pwd)
source ${basepath}/common.sh


function help() {
    echo "[HELP] call script '${scriptname}' with <NAMESPACE>"
}

function installAllTask()
{
    for taskPath in ${basepath}/../task/*
    do
        if [ -d "$taskPath" ]; then
            echo "[INFO] take ${taskPath} ${taskPath##*/}"
            source ${basepath}/task-install.sh "${NAMESPACE}" "${taskPath##*/}" 
        fi
    done
}

checkParam1 "$@"

source ${basepath}/remote-catalog-install.sh "${NAMESPACE}" 

installAllTask
