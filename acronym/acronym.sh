#!/usr/bin/env bash

function acronym() {

  sentence=${1//-/ }
  acr=""
  set -f
  for word in $sentence; do
    word=${word//[^[:alpha:]]/}
    [[ -n $word ]] && acr+=${word:0:1}
  done
  echo "${acr^^}"
}

acronym "$@"
