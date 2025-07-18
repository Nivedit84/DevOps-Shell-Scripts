#!/bin/bash
touch process-list.txt

ps aux --sort=-%cpu,-%mem >> process-list.txt

awk 'NR>1 && ($3 > 1 || $4 > 1) { system ("kill -9 "$2 ); printf "%s has been terminated\n", $2}' process-list.txt