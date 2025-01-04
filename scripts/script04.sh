#!/bin/bash

# Script: This script retrieves and displays logged-in users and comprehensive network interface information.
# - Use set -e to exit immediately if a command exits with a non-zero status.
# - Use set -u to treat unset variables as an error.
# - Log outputs for auditing and troubleshooting.


# Exit immediately if a command exits with a non-zero status
set -e
set -u

# Define a log file for output (consider using a secure location)
LOG_FILE="/var/log/user_network_info.log"

# Start logging
{
    echo "==== User and Network Information ===="

    # Display logged-in users
    echo "Logged-in Users:"
    who || { echo "Failed to retrieve logged-in users"; exit 1; } # error handling

    echo -e "\nNetwork Interfaces:"

    # Display network interfaces and filter for relevant information
    ip addr show | grep -E "^[0-9]|inet" || { echo "Failed to retrieve network interface info"; exit 1; } # error handling

    echo -e "\nRouting Table:"
    # Display the routing table
    ip route show || { echo "Failed to retrieve routing table"; exit 1; } # error handling

    echo -e "\nDNS Configuration:"
    # Display DNS configuration from resolv.conf
    cat /etc/resolv.conf || { echo "Failed to retrieve DNS configuration"; exit 1; } # error handling

    echo -e "\nActive Connections:"
    # Display active network connections
    ss -tuln || { echo "Failed to retrieve active connections"; exit 1; } # error handling

    echo -e "\nNetwork Interface Statistics:"
    # Display statistics for each network interface
    netstat -i || { echo "Failed to retrieve network interface statistics"; exit 1; } # error handling

    echo "================================"
} | tee -a "$LOG_FILE" # Log output to file and display on console

# Set appropriate permissions for the log file (uncomment if needed)
# sudo chmod 600 "$LOG_FILE"
# sudo chown root:root "$LOG_FILE"
