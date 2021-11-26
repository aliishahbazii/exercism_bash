#!/usr/bin/env bash

function scrabble_score() {

  input=${1^^}
  length=${#input}
  declare -i score=0

  for ((i = 0; i < length; i++)); do
    token=${input:(-1)}
    input=${input::-1}

    case "$token" in
      [AEIOULNRST]) ((score += 1)) ;;
      [DG]) ((score += 2)) ;;
      [BCMP]) ((score += 3)) ;;
      [FHVWY]) ((score += 4)) ;;
      [K]) ((score += 5)) ;;
      [JX]) ((score += 8)) ;;
      [QZ]) ((score += 10)) ;;

    esac
  done

  echo $score

}

scrabble_score "$@"
