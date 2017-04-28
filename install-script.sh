#!/bin/bash

DEFAULT_INST_DIR="/usr/local/bin"

source util.sh

function printHelp {
  echo -e "Installs a script by creating a link in /usr/local/bin\n"
  echo "Usage: `basename $0` SCRIPT [ INSTALLATION_NAME ]"
  echo -e "\t- INSTALLATION_NAME is optional. If not provided, then the script name (without extension) is used."
}

if [ "$1" == "-h" ] || [ "$1" == "--help" ] || [ -z "$1" ]; then
  printHelp
  exit 0
fi

TARGET=`absolutepath $1`

if [ ! -z "$2" ]; then
  LINK_NAME="$DEFAULT_INST_DIR/$2"
else
  filename=`filename $1`
  LINK_NAME="$DEFAULT_INST_DIR/$filename"
fi

ln -s "$TARGET" "$LINK_NAME"
