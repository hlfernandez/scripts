#!/bin/bash

if [[ $# -lt 1 ]]; then
    echo "Usage: $0 <directory> [--dry-run]"
    exit 1
fi

DIR="$1"
DRY_RUN=false
if [[ "$2" == "--dry-run" ]]; then
    DRY_RUN=true
fi

cd "$DIR" || { echo "Cannot access directory: $DIR"; exit 1; }

# Collect all files with numeric prefix and underscore
mapfile -t all_files < <(ls [0-9]*_* 2>/dev/null | sort)

# Extract unique prefixes (e.g., 1, 2, ...) in order of appearance
declare -A files_by_prefix
declare -a unique_prefixes

for file in "${all_files[@]}"; do
    prefix="${file%%_*}"
    if [[ -z "${files_by_prefix[$prefix]}" ]]; then
        unique_prefixes+=("$prefix")
    fi
    files_by_prefix["$prefix"]+="$file"$'\n'
done

# Determine max padding width from the numeric prefixes
padding_width=0
for prefix in "${unique_prefixes[@]}"; do
    if [[ ${#prefix} -gt $padding_width ]]; then
        padding_width=${#prefix}
    fi
done

# Reverse the list of unique prefixes
reversed_prefixes=()
for (( i=${#unique_prefixes[@]}-1 ; i>=0 ; i-- )); do
    reversed_prefixes+=("${unique_prefixes[i]}")
done

# Create temp directory
TMPDIR=$(mktemp -d)
trap 'rm -rf "$TMPDIR"' EXIT

# Assign new numbers to each group based on reverse order
new_number=1
for prefix in "${reversed_prefixes[@]}"; do
    while IFS= read -r file; do
        [[ -z "$file" ]] && continue
        base="${file#*_}"  # everything after the underscore
        padded_number=$(printf "%0*d" "$padding_width" "$new_number")
        new_name="${padded_number}_${base}"
        if $DRY_RUN; then
            echo "Would rename: $file => $new_name"
        else
            mv "$file" "$TMPDIR/$new_name"
        fi
    done <<< "${files_by_prefix[$prefix]}"
    ((new_number++))
done

# Move renamed files back
if ! $DRY_RUN; then
    mv "$TMPDIR"/* .
    echo "Renaming complete."
fi
