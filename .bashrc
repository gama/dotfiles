# .bashrc

umask 022;

# Environment variables
export PATH="${PATH}:${HOME}/bin:/sbin:/usr/sbin"
export PAGER='less'
export LESSCHARSET='utf-8'
export LESS='-F -R -X -g -i -S -j .5 -x 4'
export HOST=$(hostname -s)
export LS_OPTIONS='-F -I CVS -I .svn -I \*.lo -I \*.o -I \*.la -I CMakeFiles -I cmake_install.cmake -I CMakeCache.txt --color=always'
export GREP_OPTIONS='--color=auto --binary-files=without-match --directories=skip'
export GREP_COLOR='01;32'
export PS_FORMAT='user,pid,pcpu,pmem,vsz,rss,sz,tty,stat,start,time,cmd'
export LS_COLORS='di=01;34:ex=00;33:ln=01;32:mi=01;41'
export FIGNORE='.o:.lo:.bak:.bkp:~:.class:CVS:.svn:make_install.cmake:MakeFiles'
export GLOBIGNORE='.o:.lo:.bak:.bkp:~:.class:CVS:.svn'
export HISTSIZE=5000
export HISTFILESIZE=5000
export HISTCONTROL=ignorespace:ignoredups
export EDITOR='vim'

# colored manpages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;37m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# modifiers
set -C
shopt -s histappend 
shopt -s globstar
shopt -s nullglob
shopt -s failglob

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
alias la='ls -AC'
alias lla='ls -ACl'
alias lld='ls -dCl'
alias l='ls -CF'
alias home='clear ; cd'
alias dir='ls -aFl \!* | more'
alias yes='echo yes'
alias ..='cd ..'
alias essh='exec ssh'
alias svnlogr='svn log $(svn info | awk '\''/URL:/ { print  })'\'''
alias make='nice -n 19 make'
alias lrun="LD_LIBRARY_PATH=${HOME}/local/lib:${LD_LIBRARTY_PATH} PKG_CONFIG_PATH=${HOME}/local/lib/pkgconfig ACLOCAL_FLAGS=-I\ ${HOME}/local/share/aclocal PATH=${HOME}/local/bin:${PATH}"
alias latest_albums='(cd ~/music; find . -maxdepth 3 -mindepth 3 -type d -mtime -180 | xargs -d "\n" ls -dt | head -n 20)'

# Functions
psg() {
    first_letter=${1:0:1}
    rest=${1:1}
    ps -N -C ps | grep -E ^USER.\*$\|\[$first_letter\]$rest
}
vims() {
    vim -S "${HOME}/.vim/sessions/$1";
}
# find | grep
findg() {
    cmd="find . -name '$1' -exec grep -H -n '$2' {} \;";
    eval $cmd;
}
# find in parent dirs
findp() {
    d="${PWD}"
    while [[ ! -f "${d}/${1}" && "${d}" != "/" ]]; do
        d=$(dirname "${d}")
    done
    echo "${d}/${1}"
}
trash() {
    mv "$@" "${HOME}/.local/share/Trash/"
}
bci() {
    perl -e 'print(eval(shift(@ARGV)), "\n");' "$1"
}
toLowerCase () {
    for n in $1; do mv $n `echo $n | tr '[:upper:]' '[:lower:]'`; done
}
toUpperCase () {
    for n in $1; do mv $n `echo $n | tr '[:lower:]' '[:upper:]'`; done
}
reloadtheme() {
    gconftool-2 --type string --set "/desktop/gnome/interface/gtk_theme" "$1"
}
wtitle() {
    echo -e -n "\033]0;$1\007"
}
detach() {
    "$@" </dev/null >${HOME}/.detach.log 2>&1 &
}
n() {
    nice -n 19 "$@"
}
lbkp() {
    if [ -f "${1}" ]; then
        mv "${1}" "${1}~"
    fi
}

# Set prompt formatting
if [ -n "$PS1" ]; then
    case "$TERM" in
        xterm*)
            export PS1='\[\e[0;1m\][\u@\h]:\[\e[0;31m\]\W\[\e[0;01m\]->\[\e[0;00m\] '
            export PROMPT_COMMAND='history -a; echo -n -e "\e]0;${USER}@${HOST}:${PWD/${HOME}/~}\007"'
            ;;
        screen)
            export PS1='\[\e[0;1m\][\u@\h]:\[\e[0;31m\]\W\[\e[0;01m\]->\[\e[0;00m\] '
            export PROMPT_COMMAND='history -a; DIR=$([ "$PWD" == "$HOME" ] && echo \~ || basename "$PWD"); echo -n -e "\ek${USER}@${HOST}:${DIR}\e\\\\"; echo -n -e "\e]0;${USER}@${HOST}:${PWD/${HOME}/~}\007"'
            ;;
        *)
            export PS1='[\u@\h]:\W-> '
            export PROMPT_COMMAND='history -a'
            ;;
    esac
fi

# readline/inputrc modifications (if interactive)
# [ -n "$PS1" ] && bind -m vi-insert -f "${HOME}/.bash/vi-insert-keybindings" && bind -m vi-command -f "${HOME}/.bash/vi-command-keybindings"

# load agent envvars
[ -f ${HOME}/.screen_envvars ] && [ -n "${STY}" ] && source ${HOME}/.screen_envvars

# load per host settings
[ -f ${HOME}/.bash/${HOST} ] && source ${HOME}/.bash/${HOST}

# display "message of the day" if the session is iteractive
[ -n "$PS1" ] && [ -f ${HOME}/.motd ] && cat ${HOME}/.motd
