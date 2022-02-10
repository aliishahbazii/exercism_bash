#!/usr/bin/env bash

sieve_func(){
  local limit="$1"

  [[ ! $1 =~ ^[[:digit:]]+$ ]] && echo "invalid arguments" && exit 1;
  [[ $limit -le 1 ]] && echo "" && exit 0

 declare primes

 for (( i = 2; i <= limit; i++ )); do
     local isPrime=true
     for j in "${primes[@]}" ; do
         (( i % j == 0)) && isPrime=false && break
     done
     [[ $isPrime == true ]] && primes+=("$i")
 done

echo "${primes[*]}"


}

sieve_func "$@"
