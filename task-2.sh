#!/bin/bash

# Function to handle ERRORS and log them to error-log.txt
error_exit() {
    echo "$1" 1>&2
    echo "$1" >> error-log.txt
    exit 1
}

# Function to log the TIMESTAMP at the start of each execution
log_timestamp() {
    echo "---------------------------------------------------" >> error-log.txt
    echo "Execution Time: $(date)" >> error-log.txt
    echo "---------------------------------------------------" >> error-log.txt
}

# Log the timestamp of the execution to the error file
log_timestamp

# Prompt the user for the directory to search in (will be recursive)
read -p "Enter the directory to search in (e.g., /home/user or /): " SEARCH_DIR

# If the user does not enter a directory, set it to root directory '/'
if [ -z "$SEARCH_DIR" ]; then
    SEARCH_DIR="/"
    echo "No directory provided. Using root directory '/' as the search directory."
fi

# Check if the given directory exists
if [ ! -d "$SEARCH_DIR" ]; then
    error_exit "The directory '$SEARCH_DIR' does not exist. You must provide a valid search directory."
fi

# Prompt the user for the file extension
read -p "Enter the file type to search for (e.g., *.log, *.txt): " FILE_PATTERN
# Ensure the file pattern starts with '*' for matching the extension
if [[ ! "$FILE_PATTERN" =~ \* ]]; then
    FILE_PATTERN="*$FILE_PATTERN"
fi
if [ -z "$FILE_PATTERN" ]; then
    error_exit "You must provide a file type."
fi

# Prompt the user for the string to filter the files
read -p "Enter the string to filter the files: " FILTER_STRING
if [ -z "$FILTER_STRING" ]; then
    error_exit "You must provide a filter string."
fi

# Find files matching the file type in the specified directory (recursive search)
echo ""
echo "Searching for files matching '$FILE_PATTERN' in '$SEARCH_DIR'..."
FILES=$(find "$SEARCH_DIR" -type f -name "$FILE_PATTERN" 2>>error-log.txt)
if [ -z "$FILES" ]; then
    error_exit "No files found matching the pattern '$FILE_PATTERN' in the directory '$SEARCH_DIR'."
fi

# Sort the files by last modified time
SORTED=$(echo "$FILES" | xargs -I {} stat --format='%Y %n' {} 2>>error-log.txt | sort -n | cut -d' ' -f2-)

# File name for sorted list of files matching the file type
SORTED_FILE="sorted-files.txt"

# Save the sorted file list 
echo "$SORTED" > "$SORTED_FILE"
if [ $? -ne 0 ]; then
    error_exit "Failed to write to $SORTED_FILE."
fi
echo ""
echo "Sorted files saved to '$SORTED_FILE'."

# Filter the sorted files for the string provided by the user
FILTERED=$(echo "$SORTED" | grep -i "$FILTER_STRING")

# Check if any filtered files exist
if [ -z "$FILTERED" ]; then
    echo ""
    echo "No files containing the string '$FILTER_STRING' found."
else
    # Print the filtered files to the console
    echo ""
    echo "Filtered files containing '$FILTER_STRING':"
    echo "$FILTERED"
    echo ""
fi