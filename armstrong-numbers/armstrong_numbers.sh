#!/usr/bin/env bash

function armstrong() {
  declare -i num=$1
  declare -i length=${#1}
  declare -i sum=0

  for ((i = 0; i < ${#num}; i++)); do
    sum+=$((${num:i:1} ** length))
  done

  if ((num == sum)); then
    echo "true"
  else
    echo "false"
  fi
}

armstrong "$@"
