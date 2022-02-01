#!/bin/bash

#set -x

NAMESPACE=$1
CUSTOMER_VALUES=$2
scriptname=$(basename "$0")
basepath=$(cd $(dirname "$0") && pwd)
source ${basepath}/common.sh


function help() {
    echo """[HELP] call script '${scriptname}' with <NAMESPACE> <CUSTOMER_VALUES>
    - NAMESPACE         - delete in namespace: ${NAMESPACE}
    - CUSTOMER_VALUES   - use cusomter values: ${CUSTOMER_VALUES}
    """
}

checkParam1 "$@"
checkParam2 "$@"

help

source ${basepath}/extensions-delete-all.sh "$@"
source ${basepath}/task-delete-all.sh "$@"
source ${basepath}/pipeline-delete-all.sh "$@"
source ${basepath}/trigger-delete-all.sh "$@"

getTektonSourcesInNamespace "${NAMESPACE}"
