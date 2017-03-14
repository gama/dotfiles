# .bashrc

# environment variables
export LS_OPTIONS='-F -I CVS -I .svn -I \*.lo -I \*.o -I \*.la -I CMakeFiles -I cmake_install.cmake -I CMakeCache.txt -I \*.pyc --color=auto'
export LS_COLORS='di=01;34:ex=00;32:ln=00;36:mi=01;41'
export GREP_COLOR='01;32'
export LESSCHARSET='utf-8'
export LESS='-F -R -X -g -i -S -j .5 -x 4'
export PS_FORMAT='user,pid,pcpu,pmem,vsz,rss,sz,tty,stat,start,time,cmd'
export FIGNORE='.o:.lo:.bak:.bkp:~:.class:.pyc:CVS:.svn:make_install.cmake:MakeFiles'
export GLOBIGNORE='.o:.lo:.bak:.bkp:~:.class:CVS:.svn'
export HISTSIZE=5000
export HISTFILESIZE=999999
export HISTCONTROL=ignorespace:ignoredups

# aliases
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias tsh='gvfs-trash'
alias pwd='echo ${PWD}'
alias h='history'
alias ls="ls ${LS_OPTIONS}"
alias ll='ls -l'
alias la='ls -AC'
alias lh='ls -AClh'
alias lla='ls -ACl'
alias lld='ls -dCl'
alias l='ls -CF'
alias yes='echo yes'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias grep='grep --color=auto --binary-files=without-match --directories=skip'
alias make='nice -n 19 make'
alias vim=nvim
alias lynx='lynx -vikeys'

# functions
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
mdterm() {
    pandoc -s -f markdown -t html "${1}" | lynx -stdin
}
mdbrowser() {
    tmpfile=$(mktemp /tmp/markdown.XXXXXX.html)
    pandoc -s -f markdown -t html "${1}" >| "${tmpfile}"
    xdg-open "file://${tmpfile}"
    sleep 5
    rm -f "${tmpfile}"
}
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
add_to_path() {
	case ":$PATH:" in
		*":$1:"*) ;;
		*)        PATH="$1:$PATH";;
	esac
}

# set $PATH
add_to_path "${HOME}/bin"

if [ -n "$PS1" ]; then
    # colored manpages
    export LESS_TERMCAP_mb=$'\E[5m'    # start blink
    export LESS_TERMCAP_md=$'\E[1m'    # start bold
    export LESS_TERMCAP_mr=$'\E[3m'    # start reverse
    export LESS_TERMCAP_so=$'\E[1;43m' # start standout
    export LESS_TERMCAP_us=$'\E[34m'   # start underline
    export LESS_TERMCAP_me=$'\E[0m'    # end   all modes
    export LESS_TERMCAP_se=$'\E[0m'    # end   standout
    export LESS_TERMCAP_ue=$'\E[0m'    # end   underline

    # modifiers
    set -C
    shopt -s histappend 
    shopt -s globstar
    # shopt -s nullglob
    # shopt -s failglob

    # format prompt
    case "$TERM" in
        xterm*)
            export PS1='\[\e[0;1m\][\u@\h]:\[\e[0;31m\]\W\[\e[0;01m\]»\[\e[0;00m\] '
            export PROMPT_COMMAND='history -a; echo -n -e "\e]0;${USER}@${HOST}:${PWD/${HOME}/~}\007"'
            ;;
        screen*)
            wtitle() {
                printf '\033k'"$@"'\033\\'
            }
            panetitle() {
                printf '\033]2;'"$@"'\033\\'
            }
            export PS1='\[\e[0;1m\][\u@\h]:\[\e[0;31m\]\W\[\e[0;01m\]»\[\e[0;00m\] '
            # export PROMPT_COMMAND='history -a; DIR=$([ "$PWD" == "$HOME" ] && echo \~ || basename "$PWD"); echo -n -e "\ek${USER}@${HOST}:${DIR}\e\\\\"; echo -n -e "\e]0;${USER}@${HOST}:${PWD/${HOME}/~}\007"'
            export PROMPT_COMMAND='history -a; DIR=$([ "$PWD" == "$HOME" ] && echo \~ || basename "$PWD"); panetitle "${USER}@${HOST}:${DIR}"; wtitle "${USER} @ ${HOST} : ${PWD}"'
            ;;
        *)
            export PS1='[\u@\h]:\W» '
            export PROMPT_COMMAND='history -a'
            ;;
    esac

    # load homeshick
    for file in "$HOME/.homesick/repos/homeshick/homeshick.sh" "$HOME/.homesick/repos/homeshick/completions/homeshick-completion.bash"; do
        [ -f "$file" ] && source "$file";
    done

    # display "message of the day" if the session is iteractive
    [ -n "$PS1" ] && [ -f ${HOME}/.motd ] && cat ${HOME}/.motd
fi

# load per host settings
[ -f ${HOME}/.bash/${HOST} ] && source ${HOME}/.bash/${HOST}
