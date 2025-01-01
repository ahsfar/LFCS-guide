#!/bin/bash

# Script: Backup of impt dir

BACKUP_DIR="/var/backups/system_backup_$(date +%Y%m%d)"

echo "==== Backup Critical Directories ===="
echo "Creating backup directory: $BACKUP_DIR"
mkdir -p "$BACKUP_DIR"

# Backup /etc directory
echo "Backing up /etc directory..."
tar -czf "$BACKUP_DIR/etc_backup_$(date +%Y%m%d).tar.gz" /etc

echo "Backup completed. Backup stored in $BACKUP_DIR"
echo "================================"
