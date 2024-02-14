# script which prints date, current used RAM & the PID of the process utilizing highest RAM, each on new line in a file. Also set crontab to execute this script at 3:30 IST on last day of Jan , Feb, Nov excluding on the weekends.

# File Output Ex:a
# DD-MM-YYYY
# RAM-XXXMB
# PID-12345



#! /bin/bash

DATE=$(date +%d-%m-%Y)

echo "DATE = $DATE"

RAM=$(free -mh | awk 'NR==2{printf "%i", $3}')

echo "RAM = $RAM MB"

PID=$(ps -eo pid,rss --sort=-rss | awk 'NR==2{print $1}')

echo "PID = $PID"


# Execution perm :    chmod +x a1.sh

# Output : ./a1.sh

# DATE = 13-02-2024
# RAM = 1 MB
# PID = 29940


