#!/bin/bash

# Check if both arguments are provided
if [ $# -ne 2 ]; then
    echo "Error: Two arguments required. Usage: finder.sh <filesdir> <searchstr>"
    exit 1
fi

filesdir=$1
searchstr=$2

# Check if the first argument is a directory
if [ ! -d "$filesdir" ]; then
    echo "Error: '$filesdir' is not a valid directory"
    exit 1
fi

# Count the number of files
file_count=$(find "$filesdir" -type f | wc -l)

# Count the number of matching lines
match_count=$(grep -r "$searchstr" "$filesdir" 2>/dev/null | wc -l)

# Print find message
echo "The number of files are $file_count and the number of matching lines are $match_count"

exit 0