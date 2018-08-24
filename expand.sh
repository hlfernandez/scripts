#!/bin/bash

if [ "$1" == "-h" ] || [ "$1" == "--help" ] || [ $# -lt 1 ]; then
  echo "Usage: `basename $0` </path/to/file> [<expand-args>]"
  echo -e "\t<expand-args> by default is -t 2"
  exit 0
fi

FILE=$1
shift
ARGS=${*:-'-t 2'}

TMP_FILE=$(mktemp)

expand $ARGS $FILE > $TMP_FILE
rm $FILE
mv $TMP_FILE $FILE


