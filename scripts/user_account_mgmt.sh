#!/bin/bash
# Usage: ./user_management.sh [create|delete|update|list|info] username
# https://linuxscriptshub.com/essential-linux-scripts/ <-- script was found from this site but added couple of things in this:
# User Existence Check, User Creation with Home Directory, Listing Users, User Information, Error Handling.


ACTION=$1
USERNAME=$2

# Function to check if a user exists
user_exists() {
  id "${1}" &>/dev/null
}

# Function to create a user
create_user() {
  if user_exists "${USERNAME}"; then
    echo "User '${USERNAME}' already exists."
    exit 1
  fi
  sudo useradd -m "${USERNAME}" && echo "User '${USERNAME}' created successfully."
}

# Function to delete a user
delete_user() {
  if ! user_exists "${USERNAME}"; then
    echo "User '${USERNAME}' does not exist."
    exit 1
  fi
  sudo userdel -r "${USERNAME}" && echo "User '${USERNAME}' deleted successfully."
}

# Function to update a user's password
update_user() {
  if ! user_exists "${USERNAME}"; then
    echo "User '${USERNAME}' does not exist."
    exit 1
  fi
  sudo passwd "${USERNAME}" && echo "Password for '${USERNAME}' updated successfully."
}

# Function to list all users
list_users() {
  echo "List of users:"
  cut -d: -f1 /etc/passwd
}

# Function to show user information
user_info() {
  if ! user_exists "${USERNAME}"; then
    echo "User '${USERNAME}' does not exist."
    exit 1
  fi
  echo "User information for '${USERNAME}':"
  id "${USERNAME}"
}

# Main case statement
case "${ACTION}" in
  create)
    create_user
    ;;
  delete)
    delete_user
    ;;
  update)
    update_user
    ;;
  list)
    list_users
    ;;
  info)
    user_info
    ;;
  *)
    echo "Invalid action. Usage: ./user_management.sh [create|delete|update|list|info] username"
    ;;
esac
