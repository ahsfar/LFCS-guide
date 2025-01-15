#!/bin/bash

# This script identifies and manages duplicate files in a specified directory.
# Original script was taken from https://github.com/javisys/System-Administration-Scripts-Linux/blob/main/find_duplicates.sh
# Imporved the origianl version.

# Set the directory to the user's home directory
dir="$HOME"

# Create a temporary file for storing the list of files and their hashes
tmp_file=$(mktemp /tmp/duplicate_files.XXXXXX) || { echo "Failed to create temp file"; exit 1; }

# Function to calculate the MD5 hash of a file
calculate_md5() {
    md5sum "$1" | awk '{print $1}'  # Return only the hash value
}

# Loop to generate the list of files and their hashes
# Find all files and calculate their MD5 hashes
find "$dir" -type f -print0 | while IFS= read -r -d '' file; do
    hash=$(calculate_md5 "$file")  # Calculate hash
    echo "$hash $file" >> "$tmp_file"  # Store hash and filename in temp file
done

# Identify duplicate files by finding hashes that occur more than once
duplicates=$(awk '{print $1}' "$tmp_file" | sort | uniq -d)
declare -A file_map  # Array to map hashes to their corresponding files

# Populate the file_map with duplicate hashes and their files
while read -r hash; do
    files=$(grep "^$hash " "$tmp_file" | awk '{for (i=2; i<=NF; i++) print $i}')
    file_map["$hash"]="$files"  # Map hash to the list of files
done <<< "$duplicates"

# Show duplicate files and allow user to choose what to do
if [ ${#file_map[@]} -gt 0 ]; then
    echo "Duplicate files found:"
    for files in "${file_map[@]}"; do
        echo "$files"  # Print each set of duplicate files
    done
    echo

    # Prompt user for action regarding duplicate files
    echo "What do you want to do with duplicate files?"
    echo "1. Delete all duplicates"
    echo "2. Keep only one file from each set of duplicates"
    echo "3. Do nothing (leave without changes)"

    read -p "Select an option: " option  # Get user input

    case "$option" in
        1)
            # Delete all duplicate files
            for files in "${file_map[@]}"; do
                echo "$files" | xargs rm -f
            done
            echo "All duplicate files deleted."
            ;;
        2)
            # Keep the first file, delete others
            for files in "${file_map[@]}"; do
                read -r first_file rest <<< "$files"  # Separate first file from the rest
                echo "$rest" | xargs rm -f  # Delete the rest
            done
            echo "Duplicate files deleted, only one file from each set was retained."
            ;;
        3)
            echo "No changes were made. Duplicate files are maintained."
            ;;
        *)
            echo "Invalid option. No changes were made."
            ;;
    esac
else
    echo "No duplicate files were found in the specified directory."
fi

# Delete temporary file to clean up
rm -f "$tmp_file"
