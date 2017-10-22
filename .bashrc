#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Load rc scripts from ~/.bashrc.d
if [ -d ~/.bashrc.d ]
then
    for f in ~/.bashrc.d/?*.sh ; do
        [ -x "$f" ] && source "$f"
    done
    unset f
fi
