# DevOps-Shell-Scripts

1. server-stats.sh --> A script to get the server statistics like CPU usage, Memory usage, Disk filesystem usage, top 5 processes by memory and CPU and load average of the server.

2. user-accoutn-report.sh --> parses through /etc/passwd file and gives a list of actual users, their home directories and default login shells.
   
3. bulk-user-creation.sh --> Creates multiple users in bulk from a txt file using for loop, generates a random password for them, sets password for them, asks to change password at next login, and writes the name:password to a file.
   
4. file-backup.sh --> Takes a directory as an input then archives and compresses and also customizes the name of the file/directory with timestamp. (https://roadmap.sh/projects/log-archive-tool)
                      To create this as a command, add the script absolute path of PATH variable using export command.

5. service-status-checker --> Takes a service name as input and gives the status of that service (unknown, inactive, active)

6. log-cleaner.sh --> Navigate /var/log directory, finds files with .log extension and deletes .log files older than 10 days

7. disk-usage-alert.sh --> get the total disk usage then runs an if condition to check whether usage crossed the threshold or not

8. process-killer.sh --> Gets all the processes, checks for cpu and mem, if above a certain threshold, terminates the process.

9. ssh-login-alert.sh --> Gets the users who logged in to the server with what ip and at what time.

10. improved-ssh-login-alert.sh --> This version of script uses journalctl and a function to send alerts to the screen, rest logic remains same
