#!/bin/bash

set -e

trap ctrl_c INT

function ctrl_c() {
  talk "Goodbye!"
  exit 0
}

function talk() {
  if [ "$#" = "1" ]; then
    message="$1"
  else
    read message
  fi
  mimic -t "$message" -voice slt &> /dev/null
}

while [ "$?" = "0" ]; do
  sleep .2 && shuf -n 1 ./affirmations.txt | talk
done
