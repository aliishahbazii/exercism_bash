#!/usr/bin/env bash

items=(
  [1]="house that Jack built."
  [2]="malt"
  [3]="rat"
  [4]="cat"
  [5]="dog"
  [6]="cow with the crumpled horn"
  [7]="maiden all forlorn"
  [8]="man all tattered and torn"
  [9]="priest all shaven and shorn"
  [10]="rooster that crowed in the morn"
  [11]="farmer sowing his corn"
  [12]="horse and the hound and the horn"
)

that=(
  [1]=""
  [2]="lay in"
  [3]="ate"
  [4]="killed"
  [5]="worried"
  [6]="tossed"
  [7]="milked"
  [8]="kissed"
  [9]="married"
  [10]="woke"
  [11]="kept"
  [12]="belonged to")

house() {

  #validation
  (
    [[ ! $1 =~ ^[[:digit:]]+$ ]] || [[ ! $1 =~ ^[[:digit:]]+$ ]] ||
      (($1 > $2 || $1 < 1 || $1 > 12 || $2 < 1 || $2 > 12))
  ) && echo "invalid" && exit 1
  
  local -i start=$1 end=$2
  for ((i = start; i <= end; i++)); do
    declare -i n=$i
    printf "This is the %s\n" "${items[n]}"
    while ((n > 1)); do
      printf "that %s the %s\n" "${that[n]}" "${items[n - 1]}"
      (( n-=1 ))
    done
    echo
  done
}

house "$@"
