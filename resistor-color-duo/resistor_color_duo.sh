#!/usr/bin/env bash

function resisterCallerDuo() {

  local out=""
  for inp in "$1" "$2"; do
    case $inp in
    black) out+=0 ;;
    brown) out+=1 ;;
    red) out+=2 ;;
    orange) out+=3 ;;
    yellow) out+=4 ;;
    green) out+=5 ;;
    blue) out+=6 ;;
    violet) out+=7 ;;
    grey) out+=8 ;;
    white) out+=9 ;;
    *)
      echo "invalid color"
      exit 1
      ;;
    esac
  done
  echo $out
}

resisterCallerDuo "$@"
