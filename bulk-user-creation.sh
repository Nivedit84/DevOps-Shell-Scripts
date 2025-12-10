#!/bin/bash
INPUT_FILE="$HOME/names.txt"
OUTPUT_FILE="$HOME/user-pass.txt"
touch "$OUTPUT_FILE"

for name in $(cat $INPUT_FILE)
do
    sudo useradd -m "$name"  #-m creates a home directory for the user
    password=$(< /dev/urandom tr -dc 'A-Za-z0-9' | head -c10)

    echo "$name:$password" | sudo chpasswd
    sudo chage -d 0 "$name" #chage -d is change age, prompts user to enter a new password at the next login

    echo "$name:$password" >> "$OUTPUT_FILE"
done
