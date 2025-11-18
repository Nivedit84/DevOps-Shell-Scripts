#!/bin/bash

service=$1
if ! systemctl is-active -quiet $service ; then
        systemctl start $service
else
        echo "Service is running"
fi
