#!/usr/bin/env bash

function luhn() {

  #remove spaces
  input=${1// /}

  { [[ ${#input} -le 1 ]] || [[ $input == *[^0-9]* ]]; } && echo "false" && exit 0

  declare token
  declare -i result=0
  while [[ -n $input ]]; do

    token=$input
    [[ ${#input} -ge 2 ]] && token=${input:(-2):2}

    input=${input%$token}
    token=${token#0}

    if [[ $token -ne 0 ]]; then
      first=$((token % 10))

      second=$(((token / 10) * 2))
      [[ $second -gt 9 ]] && ((second -= 9))

      result+=$((first + second))
    fi

  done

  [[ $result%10 -eq 0 ]] && echo "true" && exit 0

  echo "false"
  exit 0

}

luhn "$@"
