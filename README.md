# DevOps-Shell-Scripts

1. server-stats.sh --> A script to get the server statistics like CPU usage, Memory usage, Disk filesystem usage, top 5 processes by memory and CPU and load average of the server.
2. user-accoutn-report.sh --> parses through /etc/passwd file and gives a list of actual users, their home directories and default login shells.
3. bulk-user-creation.sh --> Creates multiple users in bulk from a txt file using for loop, generates a random password for them, sets password for them, asks to change password at next login, and writes the name:password to a file.
4. file-backup.sh --> Takes a directory as an input then archives and compresses and also customizes the name of the file/directory with timestamp.\
5. service-status-checker --> Takes a service name as input and gives the status of that service (unknown, inactive, active)
6. log-cleaner.sh --> Navigate /var/log directory, finds files with .log extension and deletes .log files older than 10 days
