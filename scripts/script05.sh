#!/bin/bash

# Script: Checks the status of critical services on production servers and attempts a restart with retries if necessary.

# List of critical services to monitor (you can add more as needed)
CRITICAL_SERVICES=("ssh" "nginx" "mysql" "docker") # Example services; can be configured

# Path to store logs (you may choose a different location)
LOG_FILE="/var/log/service_status_check.log"

# Email settings (optional: configure if you want email notifications)
EMAIL="ahsar21@gmail.com"
SUBJECT="Service Status Alert - Critical Service Down"

# Retry settings
RETRY_COUNT=3         # Number of restart attempts before giving up
RETRY_DELAY=10        # Delay between retries in seconds

# Function to log output to both terminal and log file
log_message() {
    local MESSAGE="$1"
    echo "$MESSAGE" | tee -a "$LOG_FILE"  # Logs to both console and log file
}

# Function to check and restart services if necessary with retry logic
check_and_restart() {
    local SERVICE="$1"
    local ATTEMPT=1

    # Check if the service is active
    systemctl is-active --quiet "$SERVICE"
    
    # If the service is active, return true
    if [ $? -eq 0 ]; then
        log_message "$SERVICE is running."
    else
        # Service is not running, attempt to restart with retries
        log_message "$SERVICE is NOT running. Attempting to restart (Attempt $ATTEMPT of $RETRY_COUNT)..."

        while [ $ATTEMPT -le $RETRY_COUNT ]; do
            # Attempt to restart the service
            systemctl restart "$SERVICE"
            sleep "$RETRY_DELAY"

            # Check again if the service is running after attempting restart
            systemctl is-active --quiet "$SERVICE"
            if [ $? -eq 0 ]; then
                log_message "$SERVICE has been restarted and is now running."
                return 0  # Successfully restarted
            else
                log_message "$SERVICE failed to start after $ATTEMPT attempt(s)."
                ((ATTEMPT++))
            fi
        done

        # If we exit the loop, the service failed to start after retries
        log_message "$SERVICE failed to start after $RETRY_COUNT attempts."

        # Send an email alert about the failure
        echo "$SERVICE is down on $(hostname) at $(date)" | mail -s "$SUBJECT" "$EMAIL"
        
        # Exit with a non-zero status to indicate failure (useful in automated systems)
        exit 1
    fi
}

# Main script execution starts here

log_message "==== Service Status Check: $(date) ===="

# Loop through the critical services and check each one in parallel
for SERVICE in "${CRITICAL_SERVICES[@]}"; do
    log_message "Checking status of $SERVICE..."
    check_and_restart "$SERVICE" &
done

# Wait for all background jobs (parallel checks) to finish
wait

log_message "All critical services are running or have been restarted successfully."

log_message "============================================"

# Exit with success if all services are running
exit 0
