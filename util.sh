#!/bin/bash

function absolutepath {
  echo "$(cd "$(dirname "$1")"; pwd)/$(basename "$1")"
}

function filename {
  filename=$(basename "$1")
  filename="${filename%.*}"
  echo $filename  
}

function extension {
  filename=$(basename "$1")
  extension="${filename##*.}"
  echo $extension
}