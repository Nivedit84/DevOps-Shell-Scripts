#!/bin/bash

DISK_USAGE=$( df --block-size=1 | awk 'NR>1 {total+=$2; used+=$3} END {printf "%.0f\n", ( used / total ) * 100 }')
THRESHOLD=80
if (($DISK_USAGE > $THRESHOLD))
then
        echo "Disk usage crossed threshold"
else
        echo "Disk usage is below thresold"
fi