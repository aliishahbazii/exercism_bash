#!/usr/bin/env bash

function matchingBracket() {
  input=${1//[^\(\{\}\)\[\]]/}

  declare -i round=0
  declare -i curly=0
  declare -i square=0

  for ((i = 0; i < ${#input}; i++)); do
    if ((round < 0)) || ((curly < 0)) || ((square < 0)); then
      echo 'false'
      exit 0
    fi
    case ${input:i:1} in
    '(') ((round++)) ;;
    ')') ((round--)) ;;
    '{') ((curly++)) ;;
    '}') ((curly--)) ;;
    '[') ((square++)) ;;
    ']') ((square--)) ;;
    esac
  done

  if ((round != 0)) || ((curly != 0)) || ((square != 0)); then
    echo 'false'
  else
    echo 'true'
  fi

}

matchingBracket "$@"
