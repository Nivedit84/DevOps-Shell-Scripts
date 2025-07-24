#!/bin/bash

#Checks whether arguments are there or not, if not tells the script usage
if [[ -z "$1" || -z "$2" ]]; then
    echo "Usage : $0 <where to store> <what to compress>"
    exit 1
fi

OUTPUT_DIR=$1
INPUT=$2

TIMESTAMP=$(date +"%Y-%m-%d_%H:%M:%S")
ARCHIVE_NAME="${INPUT}_$TIMESTAMP.tar.gz"

#Archives and compresses the file or dir
tar -czf "$ARCHIVE_NAME" "$INPUT"

#If output dir is correct then moves the file/dir to the desired location
if [ -d "$OUTPUT_DIR"]; then
    mv "$ARCHIVE_NAME" "$OUTPUT_DIR"
fi