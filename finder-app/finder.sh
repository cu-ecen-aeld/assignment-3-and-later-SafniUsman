#---------------------------------------------
# Author: Safni Usman T
# Course: Advanced Embedded Linux Specialisation
#---------------------------------------------

#!/bin/sh

# Check if the number of arguments is not equal to 2
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <filesdir> <searchstr>"
    exit 1
fi

# Assign the command-line arguments to variables
filesdir="$1"
searchstr="$2"

# Check if filesdir is not a directory
if [ ! -d "$filesdir" ]; then
    echo "Error: $filesdir is not a directory."
    exit 1
fi

# Search for matching lines in files
num_files=$(find "$filesdir" -type f | wc -l)
num_matches=$(grep -r "$searchstr" "$filesdir" | wc -l)

# Print the results
echo "The number of files are $num_files and the number of matching lines are $num_matches"

# Exit with success
exit 0
