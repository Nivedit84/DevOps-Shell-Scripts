#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <directory_to_compress>"
    exit 1
fi


DIR="$1"                              
TIMESTAMP=$(date | awk '{print $1 " " $2 " " $3 " " $4}')
ARCHIVE_NAME="${DIR}_$TIMESTAMP.tar.gz"  

tar -czf "$ARCHIVE_NAME" "$DIR"

echo "Directory '$DIR' has been compressed to '$ARCHIVE_NAME'"