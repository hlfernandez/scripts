#!/bin/bash

FILE_ONE=${1}
FILE_TWO=${2}
NUM_LINES=${3:-"1"}

diff <(head -n ${NUM_LINES} ${FILE_ONE}) <(head -n ${NUM_LINES} ${FILE_TWO})