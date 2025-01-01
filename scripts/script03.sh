#!/bin/bash

# Script: system health info

echo "==== System Health Check ===="
echo "Uptime:"
uptime

echo -e "\nCPU Usage:"
if command -v mpstat &> /dev/null; then
    mpstat | grep -A 5 "%idle"
else
    echo "mpstat not available. Install sysstat package to use this feature."
fi

echo -e "\nMemory Usage:"
free -h

echo -e "\nDisk Usage:"
df -h

echo -e "\nTop 5 Processes by CPU Usage:"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -6

echo "================================"
