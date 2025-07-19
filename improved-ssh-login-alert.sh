#!/bin/bash

LOG_FILE="/var/log/ssh_login_alert.log"
NOTIFY_CMD="notify-send"

touch "$LOG_FILE"
chmod 600 "$LOG_FILE"

send_alert() {
    local user=$1
    local ip=$2
    local time=$3
    local msg="SSH Login: $user from $ip at $time"
    echo "$msg" >> "$LOG_FILE"
}

journalctl -u ssh --since "now" -f | while read -r line; do
    if echo "$line" | grep "Accepted" >/dev/null; then
        user=$(echo "$line" | awk '{for(i=1;i<=NF;i++){if($i=="for"){print $(i+1);exit}}}')
        ip=$(echo "$line" | awk '{for(i=1;i<=NF;i++){if($i=="from"){print $(i+1);exit}}}')
        time=$(date "+%Y-%m-%d %H:%M:%S")
        send_alert "$user" "$ip" "$time"
    fi
done
