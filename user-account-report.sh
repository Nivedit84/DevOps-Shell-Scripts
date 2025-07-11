#!/bin/bash
#Only real users will be listed in the server
awk -F: '($3 >= 1000) {
    print "Username:      " $1
    print "Home Directory:" $6
    print "Login Shell:   " $7
    print "---------------------------"
}' /etc/passwd