#!/bin/bash

OUTPUT_DIR="$2"
INPUT_DIR="$1"
TIMESTAMP=$(date +"%Y-%m-%d_%H:%M:%S")
BACKUP_DIR="${INPUT_DIR}_$TIMESTAMP.tar.gz"

tar -czf "$BACKUP_DIR" "$INPUT_DIR"

mv $BACKUP_DIR $OUTPUT_DIR
echo "BACKUP of $INPUT_DIR has been created and stored at $OUTPUT_DIR"

find "$OUTPUT_DIR" -type f  -name "*.tar.gz" -mtime +7 -exec rm {} \;
