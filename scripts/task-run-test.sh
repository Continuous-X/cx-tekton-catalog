#!/bin/bash

#set -x

TASKNAME=$1
basepath=$(dirname "$0")
source ${basepath}/common.sh


function help() {
    echo "[HELP] call script with <TASKNAME>"
}


function installTask()
{
    for versionPath in task/${TASKNAME}/*
    do
        filePath="${versionPath}/${TASKNAME}.yaml"
        echo "[INFO] take ${filePath}"
        kubectl apply -f "${versionPath}/${TASKNAME}.yaml"
    done
}

function installTests()
{
    for versionPath in task/${TASKNAME}/*
    do
        for testfilePath in ${versionPath}/test/*
        do
            echo "[INFO] take ${testfilePath}"
            kubectl apply -f "${testfilePath}"
        done
    done
}

function deleteTests()
{
    for versionPath in task/${TASKNAME}/*
    do
        for testfilePath in ${versionPath}/test/*
        do
            echo "[INFO] take ${testfilePath}"
            kubectl delete -f "${testfilePath}"
        done
    done
}

checkParam1 "$@"

installTask
deleteTests
installTests
