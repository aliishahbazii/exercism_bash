#!/usr/bin/env bash

function grain() {

  if [[ $1 != "total" ]] && { [[ $1 -le 0 ]] || [[ $1 -gt 64 ]]; } ; then
    echo "Error: invalid input"
    exit 1
  fi

  case $1 in
  "total")
    bc <<<'(2 ^ 64) -1'
    exit 0;
    ;;
  * )
    bc <<< "(2 ^ ($1 - 1))"
    exit 0;
    ;;
  esac

}

grain "$@"
