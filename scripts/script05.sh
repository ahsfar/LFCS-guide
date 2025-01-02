#!/bin/bash

# Script: Verify impt ser statuses 

CRITICAL_SERVICES=("ssh" "nginx") # Add your critical services here

echo "==== Service Status Check ===="
for SERVICE in "${CRITICAL_SERVICES[@]}"; do
    echo "Checking status of $SERVICE..."
    systemctl is-active --quiet "$SERVICE" && echo "$SERVICE is running." || echo "$SERVICE is NOT running."
done
echo "================================"
