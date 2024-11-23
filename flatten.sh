#!/bin/bash

# Usage: ./flatten.sh /path/to/main_directory

# Check if a directory was provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 /path/to/main_directory"
    exit 1
fi

# Store the main directory path
main_dir="$1"

# Check if the provided argument is a valid directory
if [ ! -d "$main_dir" ]; then
    echo "Error: '$main_dir' is not a valid directory."
    exit 1
fi

# Navigate to the main directory
cd "$main_dir" || exit

# Find all files in nested directories
find . -type f | while read -r file; do
    # Extract the directory name
    dir_name=$(dirname "$file")
    
    # Extract the base name of the file
    base_name=$(basename "$file")
    
    # Remove the leading './' from the directory name
    dir_name=${dir_name#./}

    # Construct the new file name with directory name included
    new_name="${dir_name}.${base_name}"
    
    # Move and rename the file to the main directory
    mv "$file" "./$new_name"
done

# Optionally, remove empty subdirectories after moving files
find . -type d -empty -delete

echo "Flattening and renaming completed."


