#!/bin/bash

if [ "$1" == "-h" ] || [ "$1" == "--help" ] || [ $# -ne 1 ]; then
  echo "Usage: `basename $0` </path/to/input-file>"
  exit 0
fi

od -c "$1" | grep '\\r' >> /dev/null

if [ $? -eq 1 ]; then
    echo "Linux (\n)"
else
    echo "Windows (\r\n)"
fi
