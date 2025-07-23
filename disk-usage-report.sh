#!/bin/bash

if [ -z "$1"]; then
    echo "Usage: bash <script_name> <path_of_a_directory>"
    exit 1
fi

du --max-depth=1 -h | sort -hr
echo