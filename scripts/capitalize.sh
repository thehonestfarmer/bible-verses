#!/bin/bash

# Check if the directory is provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <directory>"
  exit 1
fi

DIR=$1

# Check if the directory exists
if [ ! -d "$DIR" ]; then
  echo "Directory $DIR does not exist."
  exit 1
fi

# Capitalize the first letter of each word in the filenames
for file in "$DIR"/*; do
  if [ -f "$file" ]; then
    # Extract the directory path and filename
    DIR_PATH=$(dirname "$file")
    FILE_NAME=$(basename "$file")
    
    # Capitalize the first letter of each word in the filename
    NEW_NAME=$(echo "$FILE_NAME" | awk '{for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) tolower(substr($i,2))}1' OFS=" ")
    
    # Rename the file
    mv "$file" "$DIR_PATH/$NEW_NAME"
  fi
done

echo "Filenames in directory $DIR have been capitalized."
