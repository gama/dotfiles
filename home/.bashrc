#!/bin/bash
# .bashrc

# modifiers
set -C
shopt -s histappend
shopt -s globstar
# shopt -s nullglob
# shopt -s failglob

export HISTSIZE=3000
export HISTFILESIZE=999999
export HISTCONTROL=ignorespace:ignoredups
export HOMESHICK_DIR=/usr/local/opt/homeshick


[ -n "$PS1" ] && stty -echoctl # don't echo "^C"

# Aliases
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias tsh='gvfs-trash'
alias pwd='echo ${PWD}'
alias a='alias'
alias h='history'
alias u='unalias'
alias cls='clear'
alias m='more'
alias mroe='more'
alias ls="ls ${LS_OPTIONS}"
alias ll='ls -l'
alias lh='ls -lh'
alias la='ls -AC'
alias lla='ls -ACl'
alias lld='ls -dCl'
alias l='ls -CF'
alias home='clear ; cd'
alias dir='ls -aFl \!* | more'
alias yes='echo yes'
alias vimpager="vim -R -u ~/.vimpagerrc --noplugin"
alias xmlpager="vim -R -u ~/.vimpagerrc --noplugin -c setfiletype\\ xml -"
alias jsonpager="vim -R -u ~/.vimpagerrc --noplugin -c setfiletype\\ json -"
alias vimm="vim -c CtrlP"
alias ..='cd ..'

panetitle() {
	printf "\033]2;$*\033\\"
}

# Set prompt formatting
if [ -n "$PS1" ]; then
    case "$TERM" in
        xterm*)
            export PS1='\[\033[0;30m\][\u@\h]:\[\033[0;31m\]\W\[\033[0;30m\]->\[\033[0;00m\] '
            export PROMPT_COMMAND='history -a; echo -n -e "\033]0;${USER}@${HOST}:${PWD/${HOME}/~}\007"'
            ;;
        screen*)
            export PS1='\[\033[0;30m\][\u@\h]:\[\033[0;31m\]\W\[\033[0;30m\]->\[\033[0;00m\] '
			if [ -n "${TMUX}" ]; then
				export PROMPT_COMMAND='history -a; DIR="${PWD/${HOME}/~}"; printf "\033]2;%s\033\\" "${USER}@${HOST}:$(basename "${DIR}")"'
			else
				export PROMPT_COMMAND='history -a; DIR=$(basename "${PWD/${HOME}/~}"); echo -n -e "\033k${USER}@${HOST}:${DIR}\033\\"; echo -n -e "\e]0;${USER}@${HOST}:${PWD/${HOME}/~}\007"'
			fi
            ;;
        *)
            export PS1='[\u@\h]:\W-> '
            export PROMPT_COMMAND='history -a'
            ;;
    esac
fi

# added by homeshick
source "/usr/local/opt/homeshick/homeshick.sh"

# [ -f ~/.fzf.bash ] && source ~/.fzf.bash
