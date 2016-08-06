#!/bin/bash
# ~/.profile

umask 022;

# Functions
psg() {
    first_letter=${1:0:1}
    rest=${1:1}
    ps auxwww | grep -E ^USER.\*$\|\[$first_letter\]$rest
}
psgc() {
	psg $@ | cut -c -$COLUMNS
}
bhg() {
	grep -h "${1}" $(\ls -tr "${HOME}/.bash_history"*) | tail
}
bhga() {
	grep -h "${1}" $(\ls -tr "${HOME}/.bash_history"*)
}
vims() {
    vim -S "${HOME}/.vim/sessions/$1";
}
findg() {
    cmd="find . -name '$1' -exec grep -H -n '$2' {} \;";
    eval $cmd;
}
trash() {
    # mv "$@" "${HOME}/.local/share/Trash/"
    gvfs-trash "$@"
}
bci() {
    perl -e 'print(eval(shift(@ARGV)), "\n");' "$1"
}
downcase() {
    for n in $1; do mv $n `echo $n | tr '[:upper:]' '[:lower:]'`; done
}
upcase() {
    for n in $1; do mv $n `echo $n | tr '[:lower:]' '[:upper:]'`; done
}
wtitle() {
    echo -e -n "\033]0;$1\007"
}
panetitle() {
    echo -e -n "\033]2;$1\007"
}
detach() {
    "$@" </dev/null >${HOME}/.detach.log 2>&1 &
}
lbkp() {
    if [ -f "${1}" ]; then
        mv "${1}" "${1}~"
    fi
}
add_to_path() {
	case ":$PATH:" in
		*":$1:"*) ;;
		*)        PATH="$1:$PATH";;
	esac
}

# set $PATH
add_to_path "${HOME}/bin"

# Environment variables
export PAGER='less'
export CLICOLOR_FORCE=1
export HOST=$(hostname -s)
export LS_OPTIONS='-F -G'
export LS_COLORS='di=01;34:ex=00;32:ln=00;36:mi=01;41'
export GREP_OPTIONS='--color=auto --binary-files=without-match --directories=skip'
export GREP_COLOR='01;32'
export LESSCHARSET='utf-8'
export LESS='-F -R -X -g -i -S -j .5 -x 4'
export PS_FORMAT='user,pid,pcpu,pmem,vsz,rss,sz,tty,stat,start,time,cmd'
export FIGNORE='.o:.lo:.bak:.bkp:~:.class:CVS:.svn:make_install.cmake:MakeFiles'
export GLOBIGNORE='.o:.lo:.bak:.bkp:~:.class:CVS:.svn'
export HISTSIZE=3000
export HISTFILESIZE=999999
export HISTCONTROL=ignorespace:ignoredups
export EDITOR='vim'
#export PYTHONSTARTUP="${HOME}/.python.startup"
export HOMEBREW_GITHUB_API_TOKEN=0b820a468b0f0a23850f81f5f9cbd8b740d6c574
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export JAVA_HOME=$(/usr/libexec/java_home -v 1.7\*)

# colored manpages
export LESS_TERMCAP_mb=$'\E[5m'    # start blink
export LESS_TERMCAP_md=$'\E[1m'    # start bold
export LESS_TERMCAP_mr=$'\E[3m'    # start reverse
export LESS_TERMCAP_so=$'\E[1;43m'    # start standout
export LESS_TERMCAP_us=$'\E[34m'   # start underline
export LESS_TERMCAP_me=$'\E[0m'    # end   all modes
export LESS_TERMCAP_se=$'\E[0m'    # end   standout
export LESS_TERMCAP_ue=$'\E[0m'    # end   underline

# gpg agent
# [ -f ~/.gpg-agent-info ] && source ~/.gpg-agent-info
# if [ -S "${GPG_AGENT_INFO%%:*}" ]; then
#     export GPG_AGENT_INFO
# else
#     eval $( gpg-agent --daemon --write-env-file ~/.gpg-agent-info )
# fi
