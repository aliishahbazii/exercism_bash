#!/usr/bin/env bash

<<<<<<< HEAD
# The following comments should help you get started:
# - Bash is flexible. You may use functions or write a "raw" script.
#
# - Complex code can be made easier to read by breaking it up
#   into functions, however this is sometimes overkill in bash.
#
# - You can find links about good style and other resources
#   for Bash in './README.md'. It came with this exercise.
#
#   Example:
#   # other functions here
#   # ...
#   # ...
#
#   main () {
#     # your main function code here
#   }
#
#   # call main with all of the positional arguments
#   main "$@"
#
# *** PLEASE REMOVE THESE COMMENTS BEFORE SUBMITTING YOUR SOLUTION ***
=======
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
>>>>>>> 584060d43a30a3600ec7879b6e3f1314dac9f838
