#!/bin/bash

# Check usage
if [[ $# -lt 1 ]]; then
    echo "Usage: $0 <directory> [increment] [--dry-run]"
    exit 1
fi

DIR="$1"
INCREMENT=1
DRY_RUN=false

# Check if second argument is --dry-run or increment
if [[ "$2" == "--dry-run" ]]; then
    DRY_RUN=true
elif [[ -n "$2" ]]; then
    INCREMENT="$2"
fi

# Check if third argument is --dry-run
if [[ "$3" == "--dry-run" ]]; then
    DRY_RUN=true
fi

cd "$DIR" || { echo "Cannot access directory: $DIR"; exit 1; }

for file in *_*; do
    [[ -e "$file" ]] || continue  # skip if no matching files

    number="${file%%_*}"
    rest="${file#*_}"

    # Skip files without a valid numeric prefix
    if [[ -z "$number" || ! "$number" =~ ^[0-9]+$ ]]; then
        echo "Skipping '$file': prefix is not a valid number"
        continue
    fi

    new_number=$((10#$number + INCREMENT))
    new_name="${new_number}_${rest}"

    if $DRY_RUN; then
        echo "Would rename: $file => $new_name"
    else
        echo "Renaming: $file => $new_name"
        mv "$file" "$new_name"
    fi
done