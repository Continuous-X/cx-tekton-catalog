#!/bin/bash

#set -x

NAMESPACE=$1
scriptname=$(basename "$0")
basepath=$(cd $(dirname "$0") && pwd)
source ${basepath}/common.sh


function help() {
    echo "[HELP] call script '${scriptname}' with <NAMESPACE>"
}

function installAllTrigger()
{
    for triggerPath in ${basepath}/../trigger/*
    do
        if [ -d "$triggerPath" ]; then
            echo "[INFO] take ${triggerPath} ${triggerPath##*/}"
            source ${basepath}/trigger-install.sh "${NAMESPACE}" "${triggerPath##*/}" 
        fi
    done
}

checkParam1 "$@"

installAllTrigger
