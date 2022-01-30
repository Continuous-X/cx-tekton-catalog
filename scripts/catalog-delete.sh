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

source ${basepath}/extensions-delete-all.sh "${CUSTOMER_VALUES}"
source ${basepath}/task-delete-all.sh "$@"
source ${basepath}/pipeline-delete-all.sh "$@"
source ${basepath}/trigger-delete-all.sh "$@"

getTektonSourcesInNamespace "${NAMESPACE}"
