#!/bin/bash

# Check usage
if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <directory-with-pdfs>"
    exit 1
fi

DIR="$1"

# Check directory exists
if [[ ! -d "$DIR" ]]; then
    echo "Error: '$DIR' is not a directory"
    exit 1
fi

cd "$DIR" || { echo "Cannot access directory: $DIR"; exit 1; }

# Print header
printf "%-40s %-10s %s\n" "File" "Size" "Pages"

# Loop over PDF files
for file in *.pdf; do
    [[ -e "$file" ]] || continue
    size=$(du -h "$file" | cut -f1)
    pages=$(pdfinfo "$file" 2>/dev/null | awk '/^Pages:/ {print $2}')
    printf "%-40s %-10s %s\n" "$file" "$size" "$pages"
done
