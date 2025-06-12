#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Error: Two arguments required. Usage: writer.sh <writefile> <writestr>"
    exit 1
fi

writefile=$1
writestr=$2

writedir=$(dirname "$writefile")

mkdir -p "$writedir"

echo "$writestr" > "$writefile"

if [ $? -ne 0 ]; then
    echo "Error: Failed to create or write to file '$writefile'"
    exit 1
fi

exit 0
