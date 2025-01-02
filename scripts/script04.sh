#!/bin/bash

# Script: logged-in users & network interface info

echo "==== User and Network Information ===="
echo "Logged-in Users:"
who

echo -e "\nNetwork Interfaces:"
ip addr show | grep -E "^[0-9]|inet"

echo "================================"
