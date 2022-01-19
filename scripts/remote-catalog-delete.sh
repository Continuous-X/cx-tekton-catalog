#!/bin/bash

#set -x

NAMESPACE=$1
scriptname=$(basename "$0")
basepath=$(cd $(dirname "$0") && pwd)
source ${basepath}/common.sh


function help() {
    echo "[HELP] call script '${scriptname}' with <NAMESPACE>"
}

deleteRemoteCatalogTasks() {
  while IFS= read -r LINE; do
    IFS=": " read KEY VALUE <<< "${LINE}"
    kubectl delete -f $(echo "${VALUE}" | tr -d "'") -n "${NAMESPACE}"
  done < ${basepath}/../task/catalog.yaml
}

checkParam1 "$@"

deleteRemoteCatalogTasks
