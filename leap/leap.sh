#!/usr/bin/env bash
function leap() {

  #validate inputs
  if [ $# -ne 1 ] || [[ $1 != +([0-9]) ]]; then
    echo "Usage: leap.sh <year>";exit 1
  fi

  year=$1

  if ((year % 4 == 0)); then
    if ((year % 100 == 0)); then
      if ((year % 400 == 0)); then
        echo "true";exit 0
      else
        echo "false";exit 0
      fi
    fi
    echo "true";exit 0
  else
    echo "false";exit 0
  fi
}

leap "$@"
