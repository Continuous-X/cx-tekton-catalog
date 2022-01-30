#!/bin/bash

#set -x

CUSTOMER_VALUES=$1
scriptname=$(basename "$0")
basepath=$(cd $(dirname "$0") && pwd)
source ${basepath}/common.sh


function help() {
    echo """[HELP] call script '${scriptname}' with <CUSTOMER_VALUES>
    - CUSTOMER_VALUES   - use cusomter values: ${CUSTOMER_VALUES}
    """
}


function installAllExtensionsVersions()
{
    for versionPath in ${basepath}/../extensions/*
    do
        echo "[INFO] take ${versionPath} ${versionPath##*/}"
        source ${basepath}/extensions-install.sh "${versionPath##*/}" "${CUSTOMER_VALUES}"
    done
}

checkParam1 "$@"

installAllExtensionsVersions
