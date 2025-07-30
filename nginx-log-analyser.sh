#!/bin/bash

file="$1"

if [ ! -f "$1" ]
then
        echo "File doesn't exists"
        exit 1
fi

ips=$(cat $file | awk '{print $1}' | sort | uniq -c | sort -nr | head -n 5)
echo "Top 5 IP addresses"
echo $ips
echo
paths=$(cat $file | sed -n 's/.*\(GET\|POST\|PUT\|DELETE\) \([^ ]*\) .*/\2/p' | sort | uniq -c | sort -r | head -n 5)
echo "Top 5 requested paths"
echo $paths
echo
status=$(cat $file | sed -n 's/.*\" \([0-9]\{3\}\).*/\1/p' | sort | uniq -c | sort -r | head -n 5)
echo "Top 5 HTTP codes"
echo $status
