#!/bin/bash

# CPU Usage
cpu_usage=$( top -bn1 | awk 'NR==3 {print 100 - $8}' )
echo "CPU Usage: ${cpu_usage}%"
echo "============================"

# Memory Usage
mem_usage=$( free | awk 'NR==2 {printf "%.2f\n", (($3 - $6) / $2) * 100 }' )
echo "Memory Usage: ${mem_usage}%"
echo "============================"

# Disk Usage
disk_usage=$( df --block-size=1 | grep -v "tmpfs" | awk 'NR>1 {used+=$3; total+=$4} END {printf "%.2f\n", (used / total) * 100 }' )
echo "Disk Usage: ${disk_usage}%"
echo "============================"

# Top 5 Processes by Memory
top_processes_mem=$( ps -eo pid,comm,%mem --sort=-%mem | awk 'NR>1 && NR<6 {printf "PID: %-5s CMD: %-20s MEM: %-5s\n", $1, $2, $3 }' )
echo "Top 5 Processes by Memory:"
echo "$top_processes_mem"
echo "============================"

# Top 5 Processes by CPU
top_processes_cpu=$( ps -eo pid,comm,%cpu --sort=-%cpu | awk 'NR>1 && NR<6 {printf "PID: %-5s CMD: %-20s CPU: %-5s\n", $1, $2, $3 }' )
echo "Top 5 Processes by CPU:"
echo "$top_processes_cpu"
echo "============================"

# Load Average
load_average=$( uptime | awk '{printf "Under 1, 5 and 15 minutes: %.2f %.2f %.2f\n", $9, $10, $11 }' )
echo "$load_average"