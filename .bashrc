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
. ~/.bashrc_aliases

# Load platform specific setup
. ~/.bashrc_$platform
