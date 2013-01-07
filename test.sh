#!/bin/bash

source $PWD/funni.sh

to_lower () {
    echo ${1,,}
}

add_one () {
    echo $(($1 + 1))
}

say_one () {
    echo one
}

is_big () {
    [ $1 -gt 10 ]
}

is_lower () {
    [ "$1" = "${1,,}" ]
}

# input arrays
numbers=(9 14 5 8 28 -2 57)
strings=(Dog cat MOUSE "Hello World" platypus)

# mapped arrays
lowers=($(map to_lower "${strings[@]}"))
ones=(  $(map say_one  "${strings[@]}"))
one_up=($(map add_one  "${numbers[@]}"))

# filtered arrays
big_ones=(  $(filter is_big   "${numbers[@]}"))
lower_ones=($(filter is_lower "${strings[@]}"))


echo numbers:    "${numbers[@]}"    "(${#numbers[@]}"    "elements)"
echo strings:    "${strings[@]}"    "(${#strings[@]}"    "elements)"
echo
echo lowers:     "${lowers[@]}"     "(${#lowers[@]}"     "elements)"
echo ones:       "${ones[@]}"       "(${#ones[@]}"       "elements)"
echo one_up:     "${one_up[@]}"     "(${#one_up[@]}"     "elements)"
echo
echo big_ones:   "${big_ones[@]}"   "(${#big_ones[@]}"   "elements)"
echo lower_ones: "${lower_ones[@]}" "(${#lower_ones[@]}" "elements)"

