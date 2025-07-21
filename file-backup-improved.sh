#!/bin/bash

OUTPUT_DIR="/home/ec2-user"
INPUT_DIR=$1
TIMESTAMP=$(date +"%Y-%m-%d_%H:%M:%S")
BACKUP_DIR="${INPUT_DIR}_$TIMESTAMP.tar.gz"

tar -czf "$BACKUP_DIR" "$INPUT_DIR"

mv $BACKUP_DIR $OUTPUT_DIR
echo "BACKUP of $INPUT_DIR has been created and stored at $OUTPUT_DIR"

if [ -e $BACKUP_DIR ]
then
        file_backup=$(find "$OUTPUT_DIR" -type f -name "$BACKUP_DIR" -mtime 7)
        rm $file_backup
fi