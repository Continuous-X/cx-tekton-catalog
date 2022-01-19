#!/bin/bash

#set -x

NAMESPACE=$1
TASKNAME=$2
scriptname=$(basename "$0")
basepath=$(cd $(dirname "$0") && pwd)
source ${basepath}/common.sh


function help() {
    echo "[HELP] call script '${scriptname}' with <NAMESPACE> <TASKNAME>"
}


function deleteTask()
{
    for versionPath in ${basepath}/../task/${TASKNAME}/*
    do
        echo "[INFO] take ${versionPath}"
        kubectl delete -f "${versionPath}/" -n "${NAMESPACE}"
    done
}

checkParam1 "$@"
checkParam2 "$@"

deleteTask
