#!/bin/bash

#set -x

NAMESPACE=$1
TASKNAME=$2
scriptname=$(basename "$0")
basepath=$(cd $(dirname "$0") && pwd)
source ${basepath}/common.sh


function help() {
    echo """[HELP] call script '${scriptname}' with <NAMESPACE> <TASKNAME>
    - NAMESPACE     - install in namespace: ${NAMESPACE}
    - TASKNAME      - use task name: ${TASKNAME}
    """
}


function installTask()
{
    for versionPath in ${basepath}/../task/${TASKNAME}/*
    do
        echo "[INFO] take ${versionPath}"
        kubectl apply -f "${versionPath}/" -n "${NAMESPACE}"
    done
}

checkParam1 "$@"
checkParam2 "$@"

installTask
