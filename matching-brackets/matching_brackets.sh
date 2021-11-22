#!/usr/bin/env bash

function matchingBracket() {

  input=${1//[^\(\{\}\)\[\]]/}

  stack=''
  for ((i = 0; i < ${#input}; i++)); do
    char=${input:i:1}
    if [[ $char =~ [\{\(\[] ]]; then
      stack=$stack$char
    else
      case $char in
      ')')
        #-----------------------------------
        if [ "${stack:(-1)}" == '(' ]; then
          stack=${stack::-1}
        else
          echo 'false'
          exit 0
        fi
        ;;
      '}')
        #-----------------------------------
        if [ "${stack:(-1)}" == '{' ]; then
          stack=${stack::-1}
        else
          echo 'false'
          exit 0
        fi
        ;;
      ']')
        #-----------------------------------
        if [ "${stack:(-1)}" == '[' ]; then
          stack=${stack::-1}
        else
          echo 'false'
          exit 0
        fi
        ;;
        #-----------------------------------
      esac
    fi
  done

  if [[ -z $stack ]]; then
    echo "true"
  else
    echo "false"
  fi

}

matchingBracket "$@"
