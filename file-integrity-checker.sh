#!/bin/bash

read -p "Enter a file name: " FILE
CHECKSUM="checksums.db"
NEW_CHECKSUM="new_checksums.db"

> $NEW_CHECKSUM

if [ -f "$FILE" ]; then
    sha256sum "$FILE" >> "$NEW_CHECKSUM"
else
    echo "File : "$FILE" doesn't exist"
fi

if [ ! -f "$CHECKSUM" ]; then
    echo "No checksum file found, creating one..."
    cp "$NEW_CHECKSUM" "$CHECKSUM"
    echo "Created"
fi

read -p "Do you want to update of checksum file: " - update
if [[ "$update" == "y" ]]; then
    cp "$NEW_CHECKSUM" "$CHECKSUM"
    echo "File copied"
else
    echo "Exiting"
fi