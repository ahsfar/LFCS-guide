#!/bin/bash
# Usage: ./log_rotation.sh /path/to/logfile.log [max_size] [backup_count]
# script ref: https://linuxscriptshub.com/essential-linux-scripts/ 
# Improved version.

LOG_FILE="$1"
MAX_SIZE="${2:-10485760}" # Default to 10 MB if not provided
BACKUP_COUNT="${3:-5}"    # Default to 5 backups if not provided

# Function to check if log file exists
check_log_file() {
  if [[ ! -f "${LOG_FILE}" ]]; then
    echo "Log file '${LOG_FILE}' does not exist."
    exit 1
  fi
}

# Function to rotate the log file
rotate_log_file() {
  CURRENT_SIZE=$(wc -c <"${LOG_FILE}")

  if [ "${CURRENT_SIZE}" -gt "${MAX_SIZE}" ]; then
    TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
    mv "${LOG_FILE}" "${LOG_FILE}_${TIMESTAMP}"
    touch "${LOG_FILE}"
    echo "Log file rotated: ${LOG_FILE}_${TIMESTAMP}"
  else
    echo "Log file size is within limits."
  fi
}

# Function to clean up old log backups
cleanup_old_backups() {
  BACKUP_FILES=("${LOG_FILE}_"*)
  BACKUP_COUNT_CURRENT=${#BACKUP_FILES[@]}

  if [ "${BACKUP_COUNT_CURRENT}" -gt "${BACKUP_COUNT}" ]; then
    # Sort backups by modification time and delete the oldest
    ls -t "${BACKUP_FILES[@]}" | tail -n +$((${BACKUP_COUNT} + 1)) | xargs rm -f
    echo "Old backups cleaned up, keeping the latest ${BACKUP_COUNT} backups."
  fi
}

# Main script execution
check_log_file
rotate_log_file
cleanup_old_backups
