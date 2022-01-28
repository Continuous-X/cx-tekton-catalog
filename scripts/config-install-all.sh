#!/bin/bash

#set -x

NAMESPACE=$1
CUSTOMER_VALUES=$2
scriptname=$(basename "$0")
basepath=$(cd $(dirname "$0") && pwd)
source ${basepath}/common.sh


function help() {
    echo """[HELP] call script '${scriptname}' with <NAMESPACE> <CUSTOMER_VALUES>
    - NAMESPACE         - install in namespace: ${NAMESPACE}
    - CUSTOMER_VALUES   - use cusomter values: ${CUSTOMER_VALUES}
    """
}


function installAllConfigVersions()
{
    for versionPath in ${basepath}/../config/*
    do
        echo "[INFO] take ${versionPath} ${versionPath##*/}"
        source ${basepath}/config-install.sh "${NAMESPACE}" "${versionPath##*/}" "${CUSTOMER_VALUES}"
    done
}

checkParam1 "$@"
checkParam2 "$@"

installAllConfigVersions
