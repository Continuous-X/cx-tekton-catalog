#!/bin/bash

#set -x

NAMESPACE=$1
scriptname=$(basename "$0")
basepath=$(cd $(dirname "$0") && pwd)
source ${basepath}/common.sh


function help() {
    echo "[HELP] call script '${scriptname}' with <NAMESPACE>"
}


function deleteAllPipelines()
{
    for pipelinePath in ${basepath}/../pipeline/*
    do
        if [ -d "$pipelinePath" ]; then
            echo "[INFO] take ${pipelinePath} ${pipelinePath##*/}"
            source ${basepath}/pipeline-delete.sh "${NAMESPACE}" "${pipelinePath##*/}" 
        fi
    done
}

checkParam1 "$@"

deleteAllPipelines
