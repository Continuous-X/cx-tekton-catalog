#!/bin/bash

#set -x

NAMESPACE=$1
TRIGGERNAME=$2
scriptname=$(basename "$0")
basepath=$(cd $(dirname "$0") && pwd)
source ${basepath}/common.sh


function help() {
    echo """[HELP] call script '${scriptname}' with <NAMESPACE> <TRIGGERNAME>
    - NAMESPACE     - install in namespace: ${NAMESPACE}
    - TRIGGERNAME   - use trigger name: ${TRIGGERNAME}
    """
}


function installTrigger()
{
    for versionPath in ${basepath}/../trigger/${TRIGGERNAME}/*
    do
        echo "[INFO] take ${versionPath}"
        kubectl apply -f "${versionPath}/" -n "${NAMESPACE}"
    done
}

checkParam1 "$@"
checkParam2 "$@"

installTrigger
