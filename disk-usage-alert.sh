#!/bin/bash

disk_usage=$(df --block-size=1 | grep -v "tmpfs" | awk 'NR>1 {total+=$2; used+=$3} END {printf "%.2f\n", ( used / total) * 100}')
echo $disk_usage

THRESHOLD=80
if [[ $disk_usage > $THRESHOLD]]; then
    echo "Disk is being over utilised"
else
    echo "Disk is being under utilised"
fi