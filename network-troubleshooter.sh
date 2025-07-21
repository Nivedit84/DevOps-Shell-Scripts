#!/bin/bash


if [ ! -f "server-file.txt" ];then
    echo "file doesn't exist"
    exit 1
fi

for server in $(cat server-file.txt)
do
    if ping -c 4 -q $server > /dev/null 2>&1 ; then
        echo "$server is up"
    else
        echo "$server is down"
    fi
done