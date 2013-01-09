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

expect=(dog cat mouse "hello world" platypus)
result=($(map to_lower "${strings[@]}"))

expect=(1 1 1 1 1)
result=($(map say_one "${strings[@]}"))

expect=(10 15 6 9 29 -1 58)
result=($(map add_one "${numbers[@]}"))

expect=()
result=($(filter is_big "${numbers[@]}"))

expect=(cat platypus)
result=($(filter is_lower "${strings[@]}"))

