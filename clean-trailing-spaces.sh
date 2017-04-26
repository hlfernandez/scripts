#!/bin/bash

if [ "$1" == "-h" ] || [ "$1" == "--help" ] || [ $# -gt 2 ] ; then
  echo -e "Removes trailing spaces from the specified file.\n"
  echo "Usage: `basename $0` FILE [OPTION]"
  echo -e "\nOptions:"
  echo -e "\t-b, --backup: creates a backup file"
  exit 0
fi

FILE=$1;

BACKUP=false
if [ ! -z "$2" ]; then
  key="$2"

  case $key in
    -b|--backup)
      BACKUP=true
      ;;
    *)
      echo "Unknown option: $key" 
    ;;
  esac
fi

if [ "$BACKUP" = "true" ]; then
  sed -i.bak 's/[[:blank:]]*$//' "$FILE"
else
  sed -i 's/[[:blank:]]*$//' "$FILE"
fi