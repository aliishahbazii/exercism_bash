#!/usr/bin/env bash

function customgrep() {
  command="grep "
  if [[ -n $1 ]]; then
    while getopts ":nlivx" opt; do
      case $opt in
      n) command+="-n " ;;
      l) command+="-l " ;;
      i) command+="-i " ;;
      v) command+="-v " ;;
      x) command+="-x " ;;
      *) ;;
      esac
    done
    shift $((OPTIND - 1))
  else
    shift
  fi

  echo $command '$1' $2
  exit 0
}

customgrep "$@"
