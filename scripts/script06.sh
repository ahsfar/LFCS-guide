#!/bin/bash

# Script: Cleanup - Clears cache and temporary files

echo "==== Cleanup ===="
echo "Clearing cache and temporary files..."

# Clear system cache
sync; echo 3 > /proc/sys/vm/drop_caches

# Remove temporary files
rm -rf /tmp/*

echo "Cache and temporary files cleared."
echo "================================"
