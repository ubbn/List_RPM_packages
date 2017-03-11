#!/bin/bash

: '
Tiny, yet personally useful, script to export a list of installed RPM packages, specially useful for detecting which newly installed package corrupts or breaks the system

@author: ubbn
@date: 2012-03-10
'

# Printer function
function printLog (){
  NOW=$(date +%Y-%m-%d%t%H:%M:%S)
  echo -e "$NOW\t$1"
}

# Main function
function main(){
  CURRENT_TIME_STAMP=$(date +%Y-%m-%d_%H%M%S)
  OUTPUT_FILE="rmp-list-"$CURRENT_TIME_STAMP
  OUTDIR_DIR=/tmp
  
  printLog "Preparing rpm list output"
  # Query all packages descendingly sorted by installed date
  /usr/bin/rpm --query --all --last > $OUTPUT_DIR/$OUTPUT_FILE

  printLog "Output dir: $OUTPUT_DIR"
  printLog "Finished, saved as: $OUTPUT_FILE"
}

main

exit 0
