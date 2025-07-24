#!/bin/bash

#Create an array of files, also can do with a single files
CRITICAL_FILES=(
    "/etc/passwd"
    "/etc/hosts"
    "/etc/shadow"
)

#These 2 files helps in storing and comparing of hashes for each mentioned file
CHECKSUM="checksums.db"
NEW_CHECKSUM="new_checksums.db"

# > means either empty the file or create a new one if not already there
> "$NEW_CHECKSUM"
for file in ${CRITICAL_FILES[@]}; do
    if [ -f "$file" ]; then
    #sha256sum --> used to generate a hash for the files using a hashing algo
        sha256sum "$file" >> "$NEW_CHECKSUM"
    else
        echo "FILE: $file doesn't exist"
    fi
done

#If initial checksum file doesn't exist then creates one by copying the contents of NEW_CHECKSUM
if [ ! -f "$CHECKSUM" ]; then
    echo "No baseline found, creating baseline"
    cp "$NEW_CHECKSUM" "$CHECKSUM"
    echo "Baseline created"
fi

echo "Difference between new and old checksum: " 
#checks the differences between 2 files, if found differences are returned, if not exit code will be 0 and no output will be printed.
diff -u "$CHECKSUM" "$NEW_CHECKSUM"

