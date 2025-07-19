#!/bin/bash

LOG_FILE="$1"

if [ ! -f "$1" ]
then
        echo "File doesn't exists"
        exit 1
fi

IP_ADDRESSES=$(cat $LOG_FILE | awk '{print $1}' | sort | uniq -c | sort -nr | head -n 5)
echo "Top 5 IP addresses"
echo $IP_ADDRESSES
echo
REQUESTED_PATHS=$(cat $LOG_FILE | sed -n 's/.*\(GET\|\POST|\PUT|\DELETE\) \([^ ]*\) .*/\2/p' | sort | uniq -c | sort -nr | head -n 5)
echo "Top 5 paths"
echo $REQUESTED_PATHS
echo
STATUS_CODES=$(cat $LOG_FILE | awk '{print $9}' | sort | uniq -c | sort -nr | head -n 5)
echo "Top status codes"
echo $STATUS_CODES
echo
#display $IP_ADDRESSES $REQUESTED_PATHS $STATUS_CODES
