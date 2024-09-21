#!/usr/bin/env bash

function trigger_binder() {
    local URL="${1}"

    local STATUSCODE=$(curl -L --connect-timeout 10 --max-time 45 --write-out "%{http_code}" "${URL}")
    
    if test $STATUSCODE -ne 200; then
        exit 1
    fi

    return $curl_return

}

trigger_binder "$@"
