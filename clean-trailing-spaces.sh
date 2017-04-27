#!/bin/bash

if [ "$1" == "-h" ] || [ "$1" == "--help" ] ; then
  echo -e "Removes trailing spaces from the specified file.\n"
  echo "Usage: `basename $0` [OPTION] FILEs"
  echo -e "\nOptions:"
  echo -e "\t-b, --backup: creates a backup file"
  exit 0
fi

BACKUP=false
if [ ! -z "$1" ]; then
  key="$1"

  case $key in
    -b|--backup)
      BACKUP=true
      shift
      ;;
  esac
fi

for FILE in "$@"
do
  if [ "$BACKUP" = "true" ]; then
    sed -i.bak 's/[[:blank:]]*$//' "$FILE"
  else
    sed -i 's/[[:blank:]]*$//' "$FILE"
  fi
done