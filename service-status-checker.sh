#!/bin/bash

function service_status() {

        status=sudo systemctl is-active $1
        echo $status
}

service_status $1