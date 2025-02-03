#!/bin/bash

# SSL Certificate Expiration Monitor
# Author: Ahsan Farooq
# Last Updated: 2025-02-03
# Description: Monitors SSL certificate expiration dates for multiple domains and sends notifications via email and/or Slack

# Configuration
DOMAINS=(
    "example.com"
    "api.example.com"
    "secure.example.com"
)
EMAIL_RECIPIENTS=("admin@example.com" "security@example.com")
SLACK_WEBHOOK_URL="https://hooks.slack.com/services/YOUR/WEBHOOK/URL"
WARNING_THRESHOLD=30  # Warning if expiring within 30 days
CRITICAL_THRESHOLD=14 # Critical if expiring within 14 days
LOG_FILE="/var/log/ssl-monitor.log"
TEMP_FILE="/tmp/ssl-check-$$.tmp"

# Logging function
log() {
    local level=$1
    shift
    local message="[$(date '+%Y-%m-%d %H:%M:%S')] [$level] $*"
    echo "$message" >> "$LOG_FILE"
    echo "$message"
}

# Slack notification function
send_slack_notification() {
    local message=$1
    local color=$2
    
    if [ -n "$SLACK_WEBHOOK_URL" ]; then
        curl -s -X POST --data-urlencode "payload={\"attachments\": [{\"color\": \"$color\", \"text\": \"$message\"}]}" "$SLACK_WEBHOOK_URL"
    fi
}

# Email notification function
send_email_notification() {
    local subject=$1
    local message=$2
    
    for recipient in "${EMAIL_RECIPIENTS[@]}"; do
        echo "$message" | mail -s "$subject" "$recipient"
    done
}

# Check if required tools are installed
for cmd in openssl date curl mail; do
    if ! command -v "$cmd" >/dev/null 2>&1; then
        log "ERROR" "Required command '$cmd' not found. Please install it."
        exit 1
    fi
}

# Create log file if it doesn't exist
touch "$LOG_FILE"

log "INFO" "Starting SSL certificate expiration check"

# Initialize summary
summary=""
has_warnings=false
has_critical=false

# Check each domain
for domain in "${DOMAINS[@]}"; do
    log "INFO" "Checking $domain"
    
    # Get certificate expiration date
    if ! timeout 10 bash -c "echo | openssl s_client -servername $domain -connect $domain:443 2>/dev/null" > "$TEMP_FILE"; then
        log "ERROR" "Could not connect to $domain"
        summary="$summary\n❌ Failed to connect to $domain"
        continue
    fi
    
    EXPIRATION_DATE=$(openssl x509 -in "$TEMP_FILE" -enddate -noout | awk -F= '{print $2}')
    EXPIRATION_SECONDS=$(date -d "$EXPIRATION_DATE" +%s)
    CURRENT_SECONDS=$(date +%s)
    DAYS_REMAINING=$(( (EXPIRATION_SECONDS - CURRENT_SECONDS) / 86400 ))
    
    # Check expiration status
    if [ "$DAYS_REMAINING" -lt "$CRITICAL_THRESHOLD" ]; then
        status="CRITICAL"
        color="danger"
        has_critical=true
    elif [ "$DAYS_REMAINING" -lt "$WARNING_THRESHOLD" ]; then
        status="WARNING"
        color="warning"
        has_warnings=true
    else
        status="OK"
        color="good"
    fi
    
    message="$domain expires in $DAYS_REMAINING days (on $EXPIRATION_DATE)"
    log "$status" "$message"
    summary="$summary\n[$status] $message"
    
    # Send immediate notification for critical/warning status
    if [ "$status" != "OK" ]; then
        send_slack_notification "🔔 SSL Certificate Alert: $message" "$color"
        send_email_notification "SSL Certificate $status - $domain" "$message"
    fi
done

# Clean up temporary file
rm -f "$TEMP_FILE"

# Send daily summary
if $has_critical; then
    summary_status="CRITICAL"
    color="danger"
elif $has_warnings; then
    summary_status="WARNING"
    color="warning"
else
    summary_status="OK"
    color="good"
fi

summary_message="SSL Certificate Status Summary:\n$summary"
send_slack_notification "$summary_message" "$color"
send_email_notification "Daily SSL Certificate Status - $summary_status" "$summary_message"

log "INFO" "SSL certificate check completed"

exit 0
