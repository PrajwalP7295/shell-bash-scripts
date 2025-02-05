#!/bin/bash

# Get Current DATE and TIME
DATE=$(date "+%Y-%m-%d %H:%M:%S")

# Get TOTAL and USED RAM in MB
TOTAL_RAM=$(free -m | awk 'NR==2 {print $2}')
USED_RAM=$(free -m | awk 'NR==2 {print $3}')
RAM_PERCENT=$(( 100 * USED_RAM / TOTAL_RAM ))  # RAM Usage Percentage

# Get TOTAL and USED SWAP memory
TOTAL_SWAP=$(free -m | awk 'NR==3 {print $2}')
USED_SWAP=$(free -m | awk 'NR==3 {print $3}')

# Get Disk USAGE 
DISK_USAGE=$(df -h --output=source,size,used,avail,pcent /)
DISK_HEADERS=$(echo "$DISK_USAGE" | head -n 1)  # Get headers
DISK_DATA=$(echo "$DISK_USAGE" | tail -n +2)  # Get the data (excluding headers)

# Get the TOP 5 MEMORY-consuming processes
TOP_MEM_PROCESSES=$(ps -eo pid,%mem,comm --sort=-%mem | awk 'NR==2,NR==6 {printf "%-10s %-10s %-20s\n", $1, $2"%", $3}')

# Get the TOP 5 CPU-consuming processes
TOP_CPU_PROCESSES=$(ps -eo pid,%cpu,comm --sort=-%cpu | awk 'NR==2,NR==6 {printf "%-10s %-10s %-20s\n", $1, $2"%", $3}')

echo "----------------------------------------------------"
echo "Date & Time:  $DATE"
echo "----------------------------------------------------"
echo "###### Memory Usage ######"
echo "----------------------------------------------------"
echo "Total RAM:    ${TOTAL_RAM}MB"
echo "Used RAM:     ${USED_RAM}MB (${RAM_PERCENT}%)"
echo "Total Swap:   ${TOTAL_SWAP}MB"
echo "Used Swap:    ${USED_SWAP}MB"
echo "----------------------------------------------------"
echo "###### Disk Usage ######"
echo "----------------------------------------------------"
echo "$DISK_HEADERS"
echo "$DISK_DATA"
echo "----------------------------------------------------"
echo "###### Top 5 Memory-Consuming Processes ######"
echo "----------------------------------------------------"
echo "PID        %MEM      Process Name"
echo "----------------------------------------------------"
echo "$TOP_MEM_PROCESSES"
echo "----------------------------------------------------"
echo "###### Top 5 CPU-Consuming Processes ######"
echo "----------------------------------------------------"
echo "PID        %CPU      Process Name"
echo "----------------------------------------------------"
echo "$TOP_CPU_PROCESSES"
echo "----------------------------------------------------"