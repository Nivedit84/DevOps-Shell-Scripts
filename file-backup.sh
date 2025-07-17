#!/bin/bash

OUTPUT_DIRECTORY=$2

if [ -z "$1" ]
then
        echo "USAGE: $0 <Directory to compress> <Directory to move the compressed file>"
        exit 1
fi
DIR=$1
TIMESTAMP=$(date +"%Y-%m-%d_%H:%M:%S")
ARCHIVE_NAME="${DIR}_$TIMESTAMP.tar.gz"

tar -czf "$ARCHIVE_NAME" "$DIR"

if [ -n "$OUTPUT_DIRECTORY" ]
then
        mv $ARCHIVE_NAME ${OUTPUT_DIRECTORY}
        echo "Compressed file has been moved to ${OUTPUT_DIRECTORY}${ARCHIVE_NAME}"
fi
