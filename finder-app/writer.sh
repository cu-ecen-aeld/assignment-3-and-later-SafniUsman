#!/bin/bash

# Check if the number of arguments is not equal to 2
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <writefile> <writestr>"
    exit 1
fi

# Assign the command-line arguments to variables
writefile="$1"
writestr="$2"

# Check if writefile argument is empty
if [ -z "$writefile" ]; then
    echo "Error: writefile argument is not specified."
    exit 1
fi

# Check if writestr argument is empty
if [ -z "$writestr" ]; then
    echo "Error: writestr argument is not specified."
    exit 1
fi

# Create the directory if it doesn't exist
dirpath="$(dirname "$writefile")"
mkdir -p "$dirpath"

# Write the content to the file, overwriting if it exists
echo "$writestr" > "$writefile"

# Check if the write operation was successful
if [ "$?" -ne 0 ]; then
    echo "Error: Failed to write to $writefile."
    exit 1
fi

# Success message
echo "Content successfully written to $writefile"

# Exit with success
exit 0

