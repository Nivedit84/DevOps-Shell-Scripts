#!/bin/bash
output_file=user_password.txt
 
for name in $(cat names.txt)
do
#-m: creates the home directory automatically
sudo useradd -m "$name"
#Generating a random password
password=$(< /dev/urandom tr -dc 'A-Za-z0-9' | head -c10)
#chpasswd takes input in the form of username:password, assigns the password to user
echo "$name:$password" | sudo chpasswd
#chage -d 0 (sets the password change date to 0) , asks user to change the password at next login
sudo chage -d 0 "$name"
echo "$name:$password" >> $output_file

done