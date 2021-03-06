#!/bin/bash

#set -x

NAMESPACE=$1
EXTENSION_VERSION=$2
CUSTOMER_VALUES=$3
scriptname=$(basename "$0")
basepath=$(cd $(dirname "$0") && pwd)
source ${basepath}/common.sh


function help() {
    echo """[HELP] call script '${scriptname}' with <NAMESPACE> <EXTENSION_VERSION> <CUSTOMER_VALUES>
    - NAMESPACE         - install in namespace: ${NAMESPACE}
    - EXTENSION_VERSION - use extension version: ${EXTENSION_VERSION}
    - CUSTOMER_VALUES   - use cusomter values: ${CUSTOMER_VALUES}
    """
}

function checkCustomerValueFile() {
    if [ -f "${CUSTOMER_VALUES}" ]; then
        echo "customer values file exist: ${CUSTOMER_VALUES}"
    else
        echo "customer values file not exist: ${CUSTOMER_VALUES}"
        exit 1
    fi
}


function installExtensionsVersion()
{
    helmChartVersionPath="${basepath}/../extensions/${EXTENSION_VERSION}/"
    helmTemplateFile="${helmChartVersionPath}/helm-template.yaml"

    helm template "${helmChartVersionPath}" -f "${CUSTOMER_VALUES}" --set global.namespace="${NAMESPACE}"  > "${helmTemplateFile}"
    kubectl apply -f "${helmTemplateFile}" -n "${NAMESPACE}"
}

checkParam1 "$@"
checkParam2 "$@"
checkParam3 "$@"

help

checkCustomerValueFile
installExtensionsVersion
