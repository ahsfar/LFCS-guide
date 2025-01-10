#!/bin/bash

# Email Configuration
SENDER="youremail@example.com"
RECEIVER="receiver@example.com"
SUBJECT="System Health Alert"
SMTP_SERVER="smtp.gmail.com"
SMTP_PORT="587"
EMAIL_PASSWORD="yourpassword"

# Thresholds for CPU, RAM, and Disk usage
CPU_THRESHOLD=90
RAM_THRESHOLD=80
DISK_THRESHOLD=90

# Define critical services to monitor
SERVICES=("httpd" "nginx" "mysql" "postgresql")

# Log file to store system health reports
LOG_FILE="/var/log/system_health.log"

# Function to send email alerts
send_email() {
    echo -e "Subject:$SUBJECT\n\n$1" | sendmail -S $SMTP_SERVER:$SMTP_PORT -f $SENDER -au$SENDER -ap$EMAIL_PASSWORD $RECEIVER
}

# Function to log system health check
log_health() {
    echo "$(date): $1" >> $LOG_FILE
}

# Check CPU Usage
check_cpu() {
    CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
    if [ $(echo "$CPU_USAGE > $CPU_THRESHOLD" | bc) -eq 1 ]; then
        ALERT="High CPU usage detected: $CPU_USAGE% (Threshold: $CPU_THRESHOLD%)"
        send_email "$ALERT"
        log_health "$ALERT"
    fi
}

# Check RAM Usage
check_ram() {
    RAM_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
    if [ $(echo "$RAM_USAGE > $RAM_THRESHOLD" | bc) -eq 1 ]; then
        ALERT="High RAM usage detected: $RAM_USAGE% (Threshold: $RAM_THRESHOLD%)"
        send_email "$ALERT"
        log_health "$ALERT"
    fi
}

# Check Disk Usage
check_disk() {
    DISK_USAGE=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g')
    if [ $DISK_USAGE -gt $DISK_THRESHOLD ]; then
        ALERT="High disk usage detected: $DISK_USAGE% (Threshold: $DISK_THRESHOLD%)"
        send_email "$ALERT"
        log_health "$ALERT"
    fi
}

# Check if critical services are running
check_services() {
    for SERVICE in "${SERVICES[@]}"; do
        if ! systemctl is-active --quiet $SERVICE; then
            ALERT="Service $SERVICE is not running!"
            send_email "$ALERT"
            log_health "$ALERT"
        fi
    done
}

# Run all health checks
check_cpu
check_ram
check_disk
check_services

# Output success message
log_health "Health check completed successfully."
