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

checkParam1 "$@"
checkParam2 "$@"

source ${basepath}/extensions-install-all.sh "CUSTOMER_VALUES"
source ${basepath}/task-install-all.sh "$@"
source ${basepath}/pipeline-install-all.sh "$@"
source ${basepath}/trigger-install-all.sh "$@"

getTektonSourcesInNamespace "${NAMESPACE}"
