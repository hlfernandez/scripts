#!/bin/bash

if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
  echo "Usage: `basename $0` [ <AIBench-folder> ] [OPTION]"
  echo -e " \nIf <AIBench-folder> is not specified, then the script will assume"
  echo -e "that it is placed in the current working directory. Use this parameter if"
  echo -e "AIBench is placed in a subdirectory of the current working directory."
  echo -e "\nOptions:"
  echo -e "\t-c, --compile: to run mvn package before starting the AIBench application"
  echo -e "\t-cc, --clean-compile: to run mvn clean package before starting the AIBench application"
  exit 0
fi

AIBENCH_FOLDER=$PWD

if [ ! -z "$1" ]; then
  AIBENCH_FOLDER=$AIBENCH_FOLDER/$1
  shift
fi

COMPILE=false
CLEAN_COMPILE=false

if [ ! -z "$1" ]; then
  key="$1"

  case $key in
    -c|--compile)
    COMPILE=true
    CLEAN_COMPILE=false
    ;;
    -cc|--clean-compile)
    COMPILE=false
    CLEAN_COMPILE=true
    ;;    
    *)
    echo "Unknown option " $key
    ;;
  esac
fi

if [ "$COMPILE" = "true" ]; then
	mvn package
elif [ "$CLEAN_COMPILE" = "true" ]; then
	mvn clean package
fi

if [ -d "$AIBENCH_FOLDER/target/dist/" ]; then
  cd $AIBENCH_FOLDER/target/dist/
  sh run.sh 
  cd ../../
elif [ -d "$AIBENCH_FOLDER/target" ]; then
  cd $AIBENCH_FOLDER/target/
  sh run.sh 
  cd ../
fi
