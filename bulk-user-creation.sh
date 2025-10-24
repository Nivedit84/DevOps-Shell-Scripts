#!/bin/bash
INPUT_FILE="$HOME/names.txt"
OUTPUT_FILE="$HOME/user-pass.txt"
touch "$OUTPUT_FILE"

for name in $(cat $INPUT_FILE)
do
    sudo useradd -m "$name"
    password=$(< /dev/urandom tr -dc 'A-Za-z0-9' | head -c10)

    echo "$name:$password" | sudo chpasswd
    sudo chage -d 0 "$name"

    echo "$name:$password" >> "$OUTPUT_FILE"
done
