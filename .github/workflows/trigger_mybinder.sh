#!/usr/bin/env bash

function trigger_binder() {
    local URL="${1}"

    local CONTENT=$(curl --location --connect-timeout 10 --write-out "%{response_code}" "${URL}")
    
    echo "Result: $CONTENT"

    local STATUSCODE=$(echo "$CONTENT" | tail -n 1)

    if [[ "$STATUS" -ge 200 && "$STATUS" -lt 300 ]]; then
        echo "Success"
        echo $CONTENT
        exit 0
    fi

    echo "Error: HTTP status $STATUS"
    exit 1
}

trigger_binder "$@"
