#!/bin/bash
platform='default'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
    platform='linux'
elif [[ "$unamestr" == 'FreeBSD' ]]; then
    platform='freebsd'
elif [[ "$unamestr" == 'Darwin' ]]; then
    # NOTE: iTerm2 looks for .bash_profile instead of .bashrc
    platform='darwin'
fi

# Enable all aliases
if [ -f ~/.bashrc_aliases ]; then
    . ~/.bashrc_aliases
fi

# Load platform specific setup
if [ -e ~/.bashrc_$platform ]; then
    . ~/.bashrc_$platform
fi

# Common settings
if [ -f ~/.pythonrc ]; then
    export PYTHONSTARTUP=~/.pythonrc
fi

# Enable virtualenvwrapper
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    source /usr/local/bin/virtualenvwrapper.sh
fi

