#!/bin/bash

#set -x

NAMESPACE=$1
scriptname=$(basename "$0")
basepath=$(cd $(dirname "$0") && pwd)
source ${basepath}/common.sh


function help() {
    echo "[HELP] call script '${scriptname}' with <NAMESPACE>"
}


function deleteExtensions()
{
    extensionsPath="${basepath}/../extensions"
    echo "[INFO] take ${extensionsPath}"
    kubectl delete -f "${extensionsPath}/" -n "${NAMESPACE}"
}

checkParam1 "$@"

deleteExtensions
