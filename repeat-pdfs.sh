#!/bin/bash

if [ "$1" == "-h" ] || [ "$1" == "--help" ] || [ $# -ne 2 ]; then
  echo "Usage: `basename $0` <file> <reps>"
  exit 1
fi

INPUT_FILE=$1
TIMES=$2

COMANDO_PDFTK="docker run --name pdftk --rm -v "$(pwd):/$(pwd)" -w "$(pwd)" hlfernandez/pdftk pdftk $INPUT_FILE cat"

for (( i=1; i<=TIMES; i++ ))
do
    COMANDO_PDFTK+=" 1-end"
done

COMANDO_PDFTK+=" output ${INPUT_FILE%.pdf}_repetido_$TIMES.pdf"

$COMANDO_PDFTK

echo "Created: ${INPUT_FILE%.pdf}_repetido_$TIMES.pdf"
