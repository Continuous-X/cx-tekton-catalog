#!/bin/bash

#set -x

NAMESPACE=$1
TASKNAME=$2
scriptname=$(basename "$0")
basepath=$(dirname "$0")
source ${basepath}/common.sh


function help() {
    echo "[HELP] call script '${scriptname}' with <NAMESPACE> <TASKNAME>"
}


function installTests()
{
    for versionPath in ${basepath}/../task/${TASKNAME}/*
    do
        echo "[INFO] take ${versionPath}"
        kubectl apply -f "${versionPath}" -n "${NAMESPACE}"
    done
}

checkParam1 "$@"
checkParam2 "$@"

source ${basepath}/task-install.sh "$@"
source ${basepath}/task-test-delete.sh "$@"

installTests
