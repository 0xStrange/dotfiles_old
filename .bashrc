#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [[ -d ~/.bashrc.d ]]
then
    for file in $(/bin/ls ~/.bashrc.d/*.sh)
    do
        source $file;
    done
fi
