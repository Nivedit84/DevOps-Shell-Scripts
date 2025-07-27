#!/bin/bash

LOG_FILE="/var/log/ssh_logins.log"

> "$LOG_FILE"
chmod 660 "$LOG_FILE"

function write_to_file() {
    local user=$1
    local ip=$2
    local time=$3

    echo "$user logged in using $ip at $time" >> "$LOG_FILE"
}
journalctl -u ssh --since now | while read -r line ; do
    if echo "$line" | grep "Accepted" > /dev/null ; then
        user=$(echo "$line" | awk '{for(i=1;i<=NF;i++){if( $i == "for"){print $(i+1);exit}}}')
        ip=$(echo "$line" | awk '{for(i=1;i<=NF;i++){if( $i == "from" ) {print $(i+1);exit}}}')
        time=$(date +"%Y-%m-%d_%H:%M:%S")

        write-to-file $user $ip $time
    fi
done

        
