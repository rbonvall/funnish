#!/bin/bash

map () {
    f=$1
    shift
    for x
    do
        echo "$($f "$x")"
    done
}

filter () {
    f=$1
    shift
    for x
    do
        if $f "$x"
        then
            echo "$x"
        fi
    done
}

