#!/bin/bash

OUTPUT_FILE="$HOME/user-pass.txt"
touch "$OUTPUT_FILE"

for name in $(cat names.txt)
do
    sudo useradd -m "$name"
    password=$(< /dev/urandom tr -dc 'A-Za-z0-9' | head -c10)

    echo "$name:$password" | sudo chpasswd
    sudo chage -d 0 "$name"

    echo "$name:$password" >> "$OUTPUT_FILE"
done