#!/usr/bin/env bash

function proverb() {

  (($# == 0)) && exit 0

  declare -a arr=("$@")
  declare -i length=${#arr[@]}

  if ((length > 1)); then
    for ((i = 0; i < length - 1; i++)); do
      echo "For want of a ${arr[i]} the ${arr[i + 1]} was lost."
    done
  fi

  echo "And all for the want of a ${arr[0]}."

}

proverb "$@"
