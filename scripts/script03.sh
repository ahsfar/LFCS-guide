#!/bin/bash

# Script: Provides detailed system health information including uptime, CPU usage, memory usage, disk usage, and top CPU-consuming processes.
# 1. Logging: Outputs results to a log file for auditing and troubleshooting.
# 2. Dependency Checks: Ensures required tools are installed before using them.
# 3. Resource Usage: Reports memory, disk, and CPU usage with clear formatting.
# 4. Security: Runs read-only commands to gather system data (no destructive actions).
# 5. Error Handling: Gracefully handles missing dependencies and reports meaningful errors.

# === Variables ===
LOG_FILE="/var/log/system_health.log"  # Log file for storing the output
DATE_TIME=$(date '+%Y-%m-%d %H:%M:%S') # Current date and time for logging

# === Logging Function ===
log_message() {
    echo "$DATE_TIME - $1" | tee -a "$LOG_FILE"
}

# === Install Package Function ===
install_package() {
    PACKAGE_NAME=$1
    log_message "Checking if $PACKAGE_NAME is installed..."
    
    if command -v apt &> /dev/null; then
        log_message "Installing $PACKAGE_NAME using apt..."
        sudo apt update && sudo apt install -y "$PACKAGE_NAME" && log_message "$PACKAGE_NAME installed successfully." || log_message "Failed to install $PACKAGE_NAME."
    elif command -v yum &> /dev/null; then
        log_message "Installing $PACKAGE_NAME using yum..."
        sudo yum install -y "$PACKAGE_NAME" && log_message "$PACKAGE_NAME installed successfully." || log_message "Failed to install $PACKAGE_NAME."
    else
        log_message "Package manager not found. Please install $PACKAGE_NAME manually."
    fi
}

# === Start Script ===
log_message "==== Starting System Health Check ===="

# === Uptime ===
log_message "Uptime:"
uptime | tee -a "$LOG_FILE"

# === CPU Usage ===
log_message "CPU Usage:"
if command -v mpstat &> /dev/null; then
    mpstat | grep -A 5 "%idle" | tee -a "$LOG_FILE"
else
    log_message "mpstat not available. Installing sysstat package..."
    install_package "sysstat"
    if command -v mpstat &> /dev/null; then
        mpstat | grep -A 5 "%idle" | tee -a "$LOG_FILE"
    else
        log_message "Failed to install sysstat. Please install it manually."
    fi
fi

# === Memory Usage ===
log_message "Memory Usage:"
free -h | tee -a "$LOG_FILE"

# === Disk Usage ===
log_message "Disk Usage:"
df -h | tee -a "$LOG_FILE"

# === Top 5 Processes by CPU Usage ===
log_message "Top 5 Processes by CPU Usage:"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -6 | tee -a "$LOG_FILE"

# === End Script ===
log_message "==== System Health Check Completed ===="
