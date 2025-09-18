#!/usr/bin/env bash

rand_numbers() {
    local seed="$1"
    local count="$2"
    local min="$3"
    local max="$4"

    awk -v seed="$seed" -v n="$count" -v min="$min" -v max="$max" '
        BEGIN {
            srand(seed)
            for (i = 1; i <= n; i++) {
                print int(min + rand() * (max - min + 1))
            }
        }
    '
}

# If script is run directly, call the function with CLI args
# Usage: ./rand_numbers.sh <seed> <count> <min> <max>
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    if [[ $# -ne 4 ]]; then
        echo "Usage: $0 <seed> <count> <min> <max>"
        exit 1
    fi
    rand_numbers "$1" "$2" "$3" "$4"
fi
