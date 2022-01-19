#!/bin/bash

#set -x

NAMESPACE=$1
scriptname=$(basename "$0")
basepath=$(cd $(dirname "$0") && pwd)
source ${basepath}/common.sh


function help() {
    echo "[HELP] call script '${scriptname}' with <NAMESPACE>"
}

checkParam1 "$@"

source ${basepath}/task-install-all.sh "$@"
source ${basepath}/pipeline-install-all.sh "$@"

echo """
check tasks in namespace '${NAMESPACE}':
----------------------------------------
"""
kubectl get tasks -n "${NAMESPACE}"

echo """
check pipelines in namespace '${NAMESPACE}':
--------------------------------------------
"""
kubectl get pipelines -n "${NAMESPACE}"
