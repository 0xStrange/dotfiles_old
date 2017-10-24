#!/bin/bash

if [ -d ~/.Xresources.d ]
then
    for f in ~/.Xresources.d/?*.Xresources
    do
        /usr/bin/xrdb -DENV_HOME="${HOME}" -merge "$f"
    done
    unset f
fi