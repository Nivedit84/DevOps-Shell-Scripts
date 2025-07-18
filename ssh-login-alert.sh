#!/bin/bash

# SSH Login Alert Script
LOG_FILE="$HOME/ssh-logs.txt"
touch "$LOG_FILE"

LOG="/var/log/auth.log"

sudo tail -Fn0 "$LOG" | while read line; do
    if echo "$line" | grep -i "Accepted" >/dev/null; then
        user=$(echo "$line" | awk '{for(i=1;i<=NF;i++){if ($i=="for"){print $(i+1);exit}}}')
        ip=$(echo "$line" | awk '{for(i=1;i<=NF;i++){if($i=="from"){print $(i+1);exit}}}')
        time=$(date +"%Y-%m-%d_%H:%M:%S")
        echo "SSH login detected: $user from $ip at $time" | tee -a "$LOG_FILE"
    fi
done