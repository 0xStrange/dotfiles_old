#!/bin/bash

if [ -d ~/.Xresources.d ] ; then
    for f in ~/.Xresources.d/?*.Xresources ; do
        /usr/bin/xrdb "$f"
    done
    unset f
fi