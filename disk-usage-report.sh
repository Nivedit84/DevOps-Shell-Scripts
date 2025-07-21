#!/bin/bash


if [ -z "$1" ];then
        echo "Usage: disk-usage-report.sh <file_path>"
        exit 1
fi


du -h --max-depth=1 $1 | sort -hr
echo

echo "Report printed at: $(date)"