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
source ${basepath}/trigger-install-all.sh "$@"

getTektonSourcesInNamespace "${NAMESPACE}"
