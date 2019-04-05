#!/bin/sh
function connect() {
        while true
        do
            #to avoid immediate run
            sleep ${REMOTE_ADB_POLLING_SEC}
            /root/wireless_connect.sh
        done
    }

if [ ! -z "$REMOTE_ADB" ]; then
    echo "inside If statement";

    if [ -z "$REMOTE_ADB_POLLING_SEC" ]; then
        REMOTE_ADB_POLLING_SEC=5
    fi
    ( trap "true" HUP ; connect ) >/dev/null 2>/dev/null </dev/null & disown
fi
    
