#!/bin/bash

set -e

trap ctrl_c INT

function ctrl_c() {
  # mimic -voice slt -t "goodbye!" &> /dev/null
  exit
}

while [ "$?" = "0" ]; do
  sleep .2 && shuf -n 1 ./affirmations.txt | mimic -voice slt &> /dev/null
done
