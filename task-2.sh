# a script to find all files with ending with .log except from path /var/log and  sort the files in ascending order by last modified/created, save this output in a file. Filter this file by string "sys" and print the output on the shell.


#! /bin/bash

FILES=$(find / -type f -name "*.log" ! -path "/var/log/*" 2>/dev/null)
# echo "Found files : "
# echo "$FILES"

SORTED=$(echo "$FILES" | xargs ls -t)
# echo "Sorted files : "
echo "$SORTED" > sorted-log-files.txt

FILTERED=$(echo "$SORTED" | grep "sys")
#echo "Filtered files : "
echo "$FILTERED" > filtered-log-files.txt



# Output : ./a2.sh

# ls: cannot access /home/jenkins_home/logs/tasks/Workspace: No such file or directory
# ls: cannot access clean-up.log: No such file or directory
# ls: cannot access /home/jenkins_home/logs/tasks/Fingerprint: No such file or directory
# ls: cannot access cleanup.log: No such file or directory
# ls: cannot access /home/jenkins_home/logs/tasks/Periodic: No such file or directory
# ls: cannot access background: No such file or directory
# ls: cannot access build: No such file or directory
# ls: cannot access discarder.log: No such file or directory

# [root@prajwal shell]# ls
# a2.sh  filtered-log-files.txt  sorted-log-files.txt
