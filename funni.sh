#!/bin/bash

map () {
    f=$1
    shift
    for x in "$@"
    do
        echo "$($f "$x")"
    done
}

filter () {
    f=$1
    shift
    for x in "$@"
    do
        if $f "$x"
        then
            echo "$x"
        fi
    done
}

