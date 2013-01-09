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

title () {
    echo
    echo === $1 ===
}

show_array () {
    args=("$@")
    echo "(${args[@]})" "(${#args[@]} elements)"
}

# input arrays
numbers=(9 14 5 8 28 -2 57)
strings=(Dog cat MOUSE "Hello World" platypus)

# tests

expect=(dog cat mouse "hello world" platypus)
result=($(map to_lower "${strings[@]}"))
title 'map to_lower'
echo 'Expected:     ' $(show_array "${expect[@]}")
echo 'Actual result:' $(show_array "${result[@]}")

expect=(one one one one one)
result=($(map say_one "${strings[@]}"))
title 'map say_one'
echo 'Expected:     ' $(show_array "${expect[@]}")
echo 'Actual result:' $(show_array "${result[@]}")

expect=(10 15 6 9 29 -1 58)
result=($(map add_one "${numbers[@]}"))
title 'map add_one'
echo 'Expected:     ' $(show_array "${expect[@]}")
echo 'Actual result:' $(show_array "${result[@]}")

expect=(14 28 57)
result=($(filter is_big "${numbers[@]}"))
title 'filter is_big'
echo 'Expected:     ' $(show_array "${expect[@]}")
echo 'Actual result:' $(show_array "${result[@]}")

title 'filter is_lower'
expect=(cat platypus)
result=($(filter is_lower "${strings[@]}"))
echo 'Expected:     ' $(show_array "${expect[@]}")
echo 'Actual result:' $(show_array "${result[@]}")

