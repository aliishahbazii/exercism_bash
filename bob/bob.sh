#!/usr/bin/env bash

function bob() {
  question="$1"
  shopt -s extglob
  case $question in
  *[![:lower:]]* ) echo "Whoa, chill out!" ;;

  esac

  shopt -u extglob

}

bob "$@"
#bob "Tom-ay-to, tom-aaaah-to."
