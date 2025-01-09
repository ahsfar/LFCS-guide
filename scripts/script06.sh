#!/bin/bash

# Script: Cleanup - safely clears system cache and removes temporary files.
# - Error handling: Exits on failure of any command or usage of unset variables.
# - Logging: Captures all output to a log file with timestamps for auditing.
# - Safety checks: Confirms the script is run as root and verifies the existence of directories before deletion.
# - Consistent output format for easier parsing and review.
# Usage: Run this script with superuser privileges (e.g., `sudo ./cleanup.sh`).
# Log file location: /var/log/cleanup.log

# Exit immediately if a command exits with a non-zero status
set -e

# Treat unset variables as an error
set -u

# Define log file for output
LOG_FILE="/var/log/cleanup.log"

# Function to log messages with a timestamp
log() {
    local message="$1"
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $message" | tee -a "$LOG_FILE"
}

# Start cleanup process
log "==== Cleanup ===="
log "Clearing cache and temporary files..."

# Check for root privileges
if [ "$(id -u)" -ne 0 ]; then
    log "Error: This script must be run as root or with sudo."
    exit 1
fi

# Clear system cache
log "Clearing system cache..."
sync; echo 3 > /proc/sys/vm/drop_caches
log "System cache cleared."

# Remove temporary files with safety check
log "Removing temporary files from /tmp..."
if [ -d /tmp ]; then
    # Optionally, you can add a confirmation prompt before deletion
    read -p "Are you sure you want to remove all files from /tmp? (y/N): " -r response
    if [[ ! $response =~ ^[Yy]$ ]]; then
        log "Cleanup aborted by user."
        exit 0
    fi

    # Log the details of the files to be deleted
    log "Files to be deleted from /tmp:"
    find /tmp -type f -printf '%T+ %p\n' | tee -a "$LOG_FILE" # Log files with timestamps

    # Count and delete files
    file_count=$(find /tmp -type f | wc -l)
    rm -rf /tmp/*
    log "Deleted $file_count files from /tmp."
else
    log "Warning: /tmp directory does not exist or is not a directory."
fi

log "Cleanup completed."
log "================================"
