alias vst='nvim -c "Gstatus | wincmd j | hide" .'
alias trash='gio trash'
alias ls='lsd --group-dirs first'
alias ll='lsd -l --group-dirs first'
alias lht='lsd -ltr --group-dirs first'
alias lhs='lsd -lSr --group-dirs first'
alias lld='fd -t d --maxdepth 1 -X lsd -ld'
alias open='xdg-open'
alias xo='xdg-open'
alias nvchad="XDG_CONFIG_HOME=~/self/nvchad/.config XDG_DATA_HOME=~/self/nvchad/.local/share nvim"

psg()       { ps auxwww | \egrep --color=yes "^USER.*\$|${1}" }
psgc()      { psg $@ | cut -c -$COLUMNS }
envg()      { env | \grep -i "$@" }
bhg()       { \grep -a -h "${1}" $(\ls -tr "${HOME}/.bash_history" "${HOME}/.bash/.bash_history"*) | tail }
bhga()      { \grep -a -h "${1}" $(\ls -tr "${HOME}/.bash_history" "${HOME}/.bash/.bash_history"*) }
bci()       { perl -e 'print(eval(shift(@ARGV)), "\n");' "$1" }
panetitle() { printf '\033]2;'"$@"'\033\\' }
n()         { nice -n 19 "$@" }
lbkp()      { [ -f "${1}" ] && mv "${1}" "${1}~" }
njp()       { nj "$@" | vimpager -c "setfiletype json" - }
421()       { echo -e -n "\x1b[\x34 q" && ssh -t desktop421 cmd /k "C:/Users/Gustavo/bin/csh.bat" }
qtc()       { echo -e -n "\x1b[\x34 q" && ssh -t desktop421 cmd /k "C:/Users/Gustavo/bin/qtc.bat $1" }
qal()       { echo -e -n "\x1b[\x34 q" && ssh -t desktop421 cmd /k "C:/Users/Gustavo/bin/qal.bat $1" }

mdstdout() {
    pandoc -s -f gfm -t html5 --css "file://$HOME/tmp/github-markdown.css" "${1}" | \
        sed -e 's/^<body>$/<body class="markdown-body" style="margin: 0 auto; max-width: 50em">/'
}

mdterm() {
    tmpfile=$(mktemp /tmp/markdown.XXXXXX.html)
    mdstdout "${1}" >| "${tmpfile}"
    w3m "file://${tmpfile}"
    sleep 1
    rm -f "${tmpfile}"
}

htmlterm() {
    pandoc -s -f html -t man "${1}" | man -l -
}

mdbrowser() {
    tmpfile=$(mktemp /tmp/markdown.XXXXXX.html)
    mdstdout "${1}" >| "${tmpfile}"
    xdg-open "file://${tmpfile}"
    sleep 2
    rm -f "${tmpfile}"
}

mdman() {
    pandoc -s -f markdown_github -t man "${1}" | groff -Dutf-8 -Tutf8 -man | less
}

wtitle() {
    [ -n "$TMUX" ] && {
        echo -e -n "\033]0;$1\007"
    } || {
        printf '\033k'"$@"'\033\\'
    }
}

vimpager() {
    if [ $# = 0 ]; then
        nvim -u NONE --noplugin -c 'runtime! macros/less.vim' "$@" -
    else
        nvim -u NONE --noplugin -c 'runtime! macros/less.vim' "$@"
    fi
}

activenv() {
    for dir in '.venv' 'venv' '.virtualenv' 'virtualenv' '../.venv' '../venv' '../.virtualenv' '../virtualenv'; do
        activate_script="${dir}/bin/activate"
        if [ -d "${dir}" -a -f "${activate_script}" ]; then
            echo -e "\e[32mloading virtualenv from \e[1m\"${dir}\"\e[0m"
            source "${activate_script}"
            break
        fi
    done
}
