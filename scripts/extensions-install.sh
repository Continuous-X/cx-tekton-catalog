#!/bin/bash

#set -x

EXTENSION_VERSION=$1
CUSTOMER_VALUES=$2
scriptname=$(basename "$0")
basepath=$(cd $(dirname "$0") && pwd)
source ${basepath}/common.sh


function help() {
    echo """[HELP] call script '${scriptname}' with <EXTENSION_VERSION> <CUSTOMER_VALUES>
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

    helm template "${helmChartVersionPath}" -f "${CUSTOMER_VALUES}" > "${helmTemplateFile}"
    kubectl apply -f "${helmTemplateFile}"
}

checkParam1 "$@"
checkParam2 "$@"

help

checkCustomerValueFile
installExtensionsVersion
