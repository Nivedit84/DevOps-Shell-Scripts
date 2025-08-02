#!/bin/bash

for port in $(cat port.txt); do
    if sudo ss -tuln | awk '{print $5}' | grep -q ":$port\$"; then
        echo "Port: $port is bound to a process and expecting traffic"
    else
        echo "Port $port is closed"
    fi
done
