#!/usr/bin/env bash

clock() {
  #validation check
  [[ $# -lt 2 ]] && echo "invalid arguments" && exit 1
  [[ ! $1 =~ ^-?[[:digit:]]+$  ]] && echo "invalid arguments" && exit 1
  [[ ! $2 =~ ^-?[[:digit:]]+$  ]] && echo "invalid arguments" && exit 1
  if (($# > 2)); then
      (($# != 4)) && echo "invalid arguments" && exit 1
      [[ ! $3 =~ ^[+-]$ ]] && echo "invalid arguments" && exit 1
      [[ ! $4 =~ ^-?[[:digit:]]+$ ]] && echo "invalid arguments" && exit 1
  fi
  declare -i minute=$((${@:2}))  || (echo "invalid arguments" && exit 1)
  declare -i hour=$(($1))

  declare -i calculatedMinute=$((minute % 60))
  [[ $calculatedMinute -lt 0 ]] && ((calculatedMinute += 60)) && ((hour -= 1))

  declare -i calculatedHour=$((((minute / 60) + hour) % 24))
  [[ $calculatedHour -lt 0 ]] && ((calculatedHour += 24))

  [[ $calculatedHour -lt 10 ]] && local stringHour="0$calculatedHour" || stringHour=$calculatedHour
  [[ $calculatedMinute -lt 10 ]] && local stringMinute="0$calculatedMinute" || stringMinute=$calculatedMinute
  echo "$stringHour:$stringMinute"
}

clock "$@"


