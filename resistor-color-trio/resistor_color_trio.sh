#!/usr/bin/env bash

color_case() {
  local out=""
  inp=$1
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
  echo $out
}

suffix_ohm() {
  local zeroCount="$1"
  local out=""
  case $(color_case "$zeroCount") in
  0) out+=' ohms' ;;
  1) out+='0 ohms' ;;
  2) out+='00 ohms' ;;
  3) out+=' kiloohms' ;;
  4) out+='0 kiloohms' ;;
  5) out+='00 kiloohms' ;;
  6) out+=' megaohms' ;;
  7) out+='0 megaohms' ;;
  8) out+='00 megaohms' ;;
  9) out+=' gigaohms' ;;
  *)
    echo "invalid color"
    exit 1
    ;;
  esac
  echo "$out"

}
levelUp() {
  local out=$1
  out=${out/'000 ohms'/' kiloohms'}
  echo "$out"
}

function resisterCallerTrio() {
  local out=""

  #first two color
  for inp in "$1" "$2"; do
    out="$out$(color_case "$inp")"
  done

  #clear
  [[ $out =~ ^0[[:digit:]]+$ ]] && out=${out:1}

  #add suffix
  out="$out$(suffix_ohm "$3")"

  #levelup
  out=$(levelUp "$out")

  #checkError

  [[ "$out" == *"invalid color"* ]] && echo "invalid color" && exit 1 || echo "$out"
}

resisterCallerTrio "$@"
