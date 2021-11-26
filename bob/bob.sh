#!/usr/bin/env bash

function bob() {
  question="$1"
  shopt -s extglob
  case $question in
    [[:upper]] & [^[:lower:]] ) echo "Whoa, chill out!" ;;
    *\?+$ ) echo "Sure." ;;

  esac

  shopt -u extglob

}

bob "$@"
#bob "Tom-ay-to, tom-aaaah-to."
