#!/bin/bash

for file in $(find /var/log -type f -name "*.log" -mtime +10);
do   
    rm -f $file 
    echo "This file has been deleted: $file"
done

