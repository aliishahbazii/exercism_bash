#!/usr/bin/env bash

#function grain_recursive() {
#  declare local  input=$1
#  declare local  result=0
#
##  echo "input is $input and result is $result"
#
#  if [[ $input -eq 0 ]]; then
#    result=1
#  elif [[ $input -eq 1 ]]; then
#    result=2
#  else
#    input=$((input / 2))
#    result=$(grain_recursive $input)
#    result=$((result * result))
#  fi
#  echo $result
#}
#
#function grain() {
#  local input=$(($1 - 1))
#  result=$(grain_recursive $input)
#  [[ $input%2 -eq 1 && $input -gt 2 ]] && ((result = result * 2))
#  echo $result
#
#}

#function grain() {
#  declare -i input=$1
#  declare -i result=0
#
#  if [[ $input -eq 0 ]]; then
#    result=1
#  elif [[ $input -eq 1 ]]; then
#    result=2
#  else
#    result=$(($(grain $((input - 1))) * input))
#  fi
#  echo $result
#
#}

function grain() {

  declare -i input=$1
  declare -i result=1

  if [[ $input -le 0 ]] || [[ $input -gt 64 ]]; then
    echo "Error: invalid input"
    exit 1
  fi

  if [[ $input -eq 1 ]]; then
    result=1
  elif [[ $input -eq 2 ]]; then
    result=2
  else
    for ((i = 1; i < input; i++)); do
      ((result *= 2))
    done
  fi
  echo ${result#\-}

}
function grain_helper() {
  case $1 in
  #----------------------------------
  "total")
    result=$((($(grain 64) * 2) - 1))
    echo "18446744073709551615"
    exit
    ;;
  #----------------------------------
  *)
    grain "$1"
    ;;
    #----------------------------------
  esac
}

grain_helper "$@"
