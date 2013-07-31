# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

#if [ "$color_prompt" = yes ]; then
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#else
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#fi

# no host in prompt
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@:\w\$ '
fi


unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

export PYTHONSTARTUP=~/.pythonrc
source /usr/local/bin/virtualenvwrapper.sh
export APPLICATION_ENV=development
alias nautilus="nautilus --no-desktop"
alias gti="git"
alias g="git"
alias killtx='kill `cat twistd.pid`'
export PATH=/home/presto/Downloads/sbt/bin:$PATH
export PYTHONPATH=/home/presto/Workspace/new_era/zeoanalytics.backend/src:/home/presto/Workspace/new_era/zeoanalytics.frontend/src:$PYTHONPATH

export VIRTUAL_ENV_DISABLE_PROMPT=1

# setup color variables
color_is_on=
color_red=
color_green=
color_yellow=
color_blue=
color_white=
color_gray=
color_bg_red=
color_off=
color_user=
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    color_is_on=true
    color_red="\[$(/usr/bin/tput setaf 1)\]"
    color_green="\[$(/usr/bin/tput setaf 2)\]"
    color_yellow="\[$(/usr/bin/tput setaf 3)\]"
    color_dark_blue="\[$(/usr/bin/tput setaf 4)\]"
    color_blue="\[$(/usr/bin/tput setaf 6)\]"
    color_white="\[$(/usr/bin/tput setaf 7)\]"
    color_gray="\[$(/usr/bin/tput setaf 8)\]"
    color_dark_gray="\[\033[1;30m\]"
    color_off="\[$(/usr/bin/tput sgr0)\]"

    color_error="$(/usr/bin/tput setab 1)$(/usr/bin/tput setaf 7)"
    color_error_off="$(/usr/bin/tput sgr0)"

    # set user color
    case `id -u` in
        0) color_user=$color_red ;;
        *) color_user=$color_green ;;
    esac
fi

# some kind of optimization - check if git installed only on config load
PS1_GIT_BIN=$(which git 2>/dev/null)

function prompt_command {
    local PS1_GIT=
    local PS1_VENV=
    local GIT_BRANCH=
    local GIT_DIRTY=
    local PWDNAME=$PWD
    local PS1_VPN=

    # beautify working directory name
    if [[ "${HOME}" == "${PWD}" ]]; then
        PWDNAME="~"
    elif [[ "${HOME}" == "${PWD:0:${#HOME}}" ]]; then
        PWDNAME="~${PWD:${#HOME}}"
    fi

    # parse git status and get git variables
    if [[ ! -z $PS1_GIT_BIN ]]; then
        # check we are in git repo
        local CUR_DIR=$PWD
        while [[ ! -d "${CUR_DIR}/.git" ]] && [[ ! "${CUR_DIR}" == "/" ]] && [[ ! "${CUR_DIR}" == "~" ]] && [[ ! "${CUR_DIR}" == "" ]]; do CUR_DIR=${CUR_DIR%/*}; done
        if [[ -d "${CUR_DIR}/.git" ]]; then
            # 'git repo for dotfiles' fix: show git status only in home dir and other git repos
            if [[ "${CUR_DIR}" != "${HOME}" ]] || [[ "${PWD}" == "${HOME}" ]]; then
                # get git branch
                GIT_BRANCH=$($PS1_GIT_BIN symbolic-ref HEAD 2>/dev/null)
                if [[ ! -z $GIT_BRANCH ]]; then
                    GIT_BRANCH=${GIT_BRANCH#refs/heads/}

                    # get git status
                    local GIT_STATUS=$($PS1_GIT_BIN status --porcelain 2>/dev/null)
                    [[ -n $GIT_STATUS ]] && GIT_DIRTY=1
                fi
            fi
        fi
    fi

    # check vpn con status
    . /home/presto/.bashrc_get_vpn_status
    vpn_con_status
    local VPN_STATUS=$?

    # build b/w prompt for git and virtual env
    [[ ! -z $GIT_BRANCH ]] && PS1_GIT=" (git: ${GIT_BRANCH})"
    [[ ! -z $VIRTUAL_ENV ]] && PS1_VENV=" (venv: ${VIRTUAL_ENV#$WORKON_HOME/})"

    # build b/w prompt for vpn
    if [[ ${VPN_STATUS} -eq 0 ]]; then
       PS1_VPN=" (vpn: on)"
    else
       PS1_VPN=" (vpn: off)"
    fi

    # calculate prompt length
    local PS1_length=$((${#USER}+${#PWDNAME}+${#PS1_GIT}+${#PS1_VENV}+${#PS1_VPN}+3))
    local FILL=

    # if length is greater, than terminal width
    if [[ $PS1_length -gt $COLUMNS ]]; then
        # strip working directory name
        PWDNAME="...${PWDNAME:$(($PS1_length-$COLUMNS+3))}"
    else
        # else calculate fillsize
        local fillsize=$(($COLUMNS-$PS1_length))
        FILL=$color_gray
        while [[ $fillsize -gt 0 ]]; do FILL="${FILL}─"; fillsize=$(($fillsize-1)); done
        FILL="${FILL}${color_off}"
    fi

    if $color_is_on; then
        # build git status for prompt
        if [[ ! -z $GIT_BRANCH ]]; then
            if [[ -z $GIT_DIRTY ]]; then
                PS1_GIT=" ${color_gray}(git:${color_off} ${color_green}${GIT_BRANCH}${color_off}${color_gray})${color_off}"
            else
                PS1_GIT=" ${color_gray}(git:${color_off} ${color_red}${GIT_BRANCH}${color_off}${color_gray})${color_off}"
            fi
        fi

        # build python venv status for prompt
        [[ ! -z $VIRTUAL_ENV ]] && PS1_VENV=" ${color_gray}(venv:${color_off} ${color_dark_blue}${VIRTUAL_ENV#$WORKON_HOME/}${color_off}${color_gray})${color_off}"
	

	
	if [[ ${VPN_STATUS} -eq 0 ]]; then
           PS1_VPN=" ${color_gray}(vpn:${color_off} ${color_green}on${color_off}${color_gray})${color_off}"
        else
           PS1_VPN=" ${color_gray}(vpn:${color_off} ${color_red}off${color_off}${color_gray})${color_off}"
        fi
    fi

    # set new color prompt
    PS1="${color_user}${USER}${color_off}:${color_white}${PWDNAME}${color_off}${PS1_GIT}${PS1_VENV}${PS1_VPN} ${FILL}\n➜ "

    # get cursor position and add new line if we're not in first column
    # cool'n'dirty trick (http://stackoverflow.com/a/2575525/1164595)
    # XXX FIXME: this hack broke ssh =(
#   exec < /dev/tty
#   local OLDSTTY=$(stty -g)
#   stty raw -echo min 0
#   echo -en "\033[6n" > /dev/tty && read -sdR CURPOS
#   stty $OLDSTTY
    echo -en "\033[6n" && read -sdR CURPOS
    [[ ${CURPOS##*;} -gt 1 ]] && echo "${color_error}↵${color_error_off}"

    # set title
    echo -ne "\033]0;${USER}@${HOSTNAME}:${PWDNAME}"; echo -ne "\007"
}

# set prompt command (title update and color prompt)
PROMPT_COMMAND=prompt_command
# set new b/w prompt (will be overwritten in 'prompt_command' later for color prompt)
PS1='\u@\h:\w\$ '

# ssh host completion
complete -W "$(echo `cat ~/.ssh/known_hosts | grep -iE '^(Host|HostName) ' | awk '{print $2}'`)" ssh

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
