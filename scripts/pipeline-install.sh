#!/bin/bash

#set -x

NAMESPACE=$1
PIPELINE=$2
scriptname=$(basename "$0")
basepath=$(dirname "$0")
source ${basepath}/common.sh


function help() {
    echo "[HELP] call script '${scriptname}' with <NAMESPACE> <PIPELINE>"
}


function installPipeline()
{
    for versionPath in ${basepath}/../pipeline/${PIPELINE}/*
    do
        echo "[INFO] take ${versionPath}"
        kubectl apply -f "${versionPath}/" -n "${NAMESPACE}"
    done
}

checkParam1 "$@"
checkParam2 "$@"

installPipeline
