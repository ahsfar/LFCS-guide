#!/bin/bash

# Menu-driven script to combine all tasks - daily_admin_tool

echo "======================================="
echo " Daily Linux System Admin Tool"
echo "======================================="
echo "1. System Health Check"
echo "2. Validate Bash Script (New)"
echo "3. Log Management"
echo "4. Backup Critical Directories"
echo "5. User and Network Info"
echo "6. Check Critical Services"
echo "7. Cleanup"
echo "8. Run All Tasks"
echo "======================================="
read -p "Choose an option [1-8]: " OPTION

case $OPTION in
    1)
        ./system_health.sh
        ;;
    2)
        # Prompt for a filename and pass it to the validation script
        read -p "Enter the filename to validate: " FILENAME
        ./validate_bash_script.sh "$FILENAME"
        ;;
    3)
        ./log_management.sh
        ;;
    4)
        ./backup.sh
        ;;
    5)
        ./user_network_info.sh
        ;;
    6)
        ./check_services.sh
        ;;
    7)
        ./cleanup.sh
        ;;
    8)
        ./system_health.sh
        ./validate_bash_script.sh
        ./log_management.sh
        ./backup.sh
        ./user_network_info.sh
        ./check_services.sh
        ./cleanup.sh
        ;;
    *)
        echo "Invalid option. Please choose between 1-8."
        ;;
esac
