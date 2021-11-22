#!/usr/bin/env bash

function pangram() {
  #remove all not alpha letters
  sentence=${1//[^[:alpha:]]/}
  #convert to lowerCase
  sentence="${sentence,,}"

  [ ${#sentence} -lt 26 ] && echo false && return 0

  declare -A a
  while [ -n "$sentence" ]; do
    chr=${sentence::1}
    sentence=${sentence#$chr}
    a[$chr]=true
  done
  [ "${#a[@]}" == 26 ] && echo true && return 0
  echo false

}
pangram "$@"
#pangram ""
