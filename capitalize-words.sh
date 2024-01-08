#!/bin/bash

capitalize_words() {
    input="$1"
    result=""

    input=$(tr '[:upper:]' '[:lower:]' <<<"$input")

    result=$(echo "$input" | awk '{ for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) tolower(substr($i,2)); }1')

    echo "$result"
}

if [ "$#" -eq 0 ]; then
    read -p "Enter an arbitrary input string: " input_string

    echo $(capitalize_words "$input_string")
else
    for arg in "$@"; do
        echo $(capitalize_words "$arg")
    done
fi
