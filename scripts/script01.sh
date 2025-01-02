#!/bin/bash

# Script: Backup Script
# 1. Variables: Define source, destination, log file, and retention policy.
# 2. Root Privileges: Ensure the script is run as root for permission-critical tasks.
# 3. Logging: Record all operations for auditing and debugging.
# 4. Backup Directory: Create a unique, timestamped directory for backups.
# 5. Backup Process: Compress the source directory into a .tar.gz file.
# 6. Secure Permissions: Restrict access to backup files (chmod 600).
# 7. Cleanup: Remove backups older than the specified retention period.
# 8. Error Handling: Gracefully handle failures with appropriate logs and exits.

# === Variables ===
BACKUP_DIR="/var/backups/system_backup_$(date +%Y%m%d)"  # Destination directory for backups
SOURCE_DIR="/etc"                                       # Source directory to back up
LOG_FILE="/var/log/backup.log"                         # Log file to record operations
RETENTION_DAYS=30                                      # Retention period for old backups (in days)
EXCLUDE_FILE="/path/to/exclude_file.txt"               # Optional: File listing paths to exclude from backup

# === Ensure Script is Run as Root ===
if [ "$(id -u)" -ne 0 ]; then
    echo "Error: This script must be run as root!" | tee -a "$LOG_FILE"
    exit 1
fi

# === Logging Function ===
log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOG_FILE"
}

# === Backup Process ===
log_message "==== Backup Critical Directories ===="

# Create backup directory
log_message "Creating backup directory: $BACKUP_DIR"
mkdir -p "$BACKUP_DIR" || { log_message "Error: Failed to create backup directory!"; exit 1; }

# Perform the backup
log_message "Backing up $SOURCE_DIR directory..."
if [ -f "$EXCLUDE_FILE" ]; then
    # If exclude file exists, exclude specified paths
    tar --exclude-from="$EXCLUDE_FILE" -czf "$BACKUP_DIR/etc_backup_$(date +%Y%m%d).tar.gz" "$SOURCE_DIR"
else
    # Regular backup without exclusions
    tar -czf "$BACKUP_DIR/etc_backup_$(date +%Y%m%d).tar.gz" "$SOURCE_DIR"
fi

# Check if the backup was successful
if [ $? -eq 0 ]; then
    log_message "Backup completed successfully. Backup stored in $BACKUP_DIR"
else
    log_message "Error: Backup process failed!"
    exit 1
fi

# === Secure Permissions ===
log_message "Setting secure permissions for the backup archive..."
chmod 600 "$BACKUP_DIR/etc_backup_$(date +%Y%m%d).tar.gz"

# === Cleanup Old Backups ===
log_message "Removing backups older than $RETENTION_DAYS days..."
find /var/backups/ -type f -name "*.tar.gz" -mtime +$RETENTION_DAYS -exec rm -f {} \;
log_message "Old backups cleaned up."

log_message "======================================"
