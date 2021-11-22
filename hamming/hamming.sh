#!/usr/bin/env bash

function hammingDistance() {
  declare in1=$1
  declare in2=$2
  declare -i distance=0

  #validation
  if [[ $# -ne 2 ]]; then
    echo "Usage: hamming.sh <string1> <string2>"
    exit 1
  fi

  if [[ ${#in1} -ne "${#in2}" ]]; then
    echo "left and right strands must be of equal length"
    exit 1
  fi
  #-----------

  until [[ -z $in1 ]]; do
    [[ ${in1:(-1)} != "${in2:(-1)}" ]] && ((distance = distance + 1))
    in1=${in1::-1}
    in2=${in2::-1}
  done
  echo "$distance"
  return 0
}

hammingDistance "$@"
