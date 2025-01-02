#!/bin/bash

# Script: Log Management - Displays recent logs and compresses old logs

LOG_DIR="/var/log"

echo "==== Log Management ===="
echo "Last 20 lines of system logs:"
if [ -f "$LOG_DIR/syslog" ]; then
    tail -n 20 "$LOG_DIR/syslog"
else
    echo "System log file not found!"
fi

# Compress logs older than 7 days
echo "Compressing old logs..."
find "$LOG_DIR" -type f -name "*.log" -mtime +7 -exec gzip {} \;
echo "Logs older than 7 days have been compressed."
echo "================================"
