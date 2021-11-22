#!/usr/bin/env bash

function convertToSoundFactor() {

  if [[ $# -lt 1 ]] || [[ $1 != +([0-9]) ]]; then
    echo "invalid args"
    exit 1
  fi

  result=""
  input=$1
  ((input % 3 == 0)) && result+='Pling'
  ((input % 5 == 0)) && result+='Plang'
  ((input % 7 == 0)) && result+='Plong'

  echo ${result:=$input}
}

convertToSoundFactor "$@"
