#!/bin/bash

#set -x

EXTENSIONS_VERSION=$1
CUSTOMER_VALUES=$2
scriptname=$(basename "$0")
basepath=$(cd $(dirname "$0") && pwd)
source ${basepath}/common.sh


function help() {
    echo """[HELP] call script '${scriptname}' with <EXTENSIONS_VERSION> <CUSTOMER_VALUES>
    - EXTENSIONS_VERSION    - use extensions version: ${EXTENSIONS_VERSION}
    - CUSTOMER_VALUES       - use cusomter values: ${CUSTOMER_VALUES}
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

function deleteExtensionsVersion()
{
    helmChartVersionPath="${basepath}/../extensions/${EXTENSIONS_VERSION}/"
    helmTemplateFile="${helmChartVersionPath}/helm-template.yaml"

    helm template "${helmChartVersionPath}" -f "${CUSTOMER_VALUES}" > "${helmTemplateFile}"
    kubectl delete -f "${helmTemplateFile}"
}

checkParam1 "$@"
checkParam2 "$@"

help

checkCustomerValueFile
deleteExtensionsVersion
