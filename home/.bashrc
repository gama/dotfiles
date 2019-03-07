# .bashrc

source "${HOME}/.bash/utils"

# environment variables
export LS_OPTIONS='-F --group-directories-first -I CVS -I .svn -I \*.lo -I \*.o -I \*.la -I CMakeFiles -I cmake_install.cmake -I CMakeCache.txt -I \*.pyc --color=auto --quoting-style=literal'
export LS_COLORS='di=01;34:ex=00;32:ln=00;36:mi=01;41:ow=01;04;32'
export GREP_COLOR='01;32'
export LC_ALL="${LC_ALL:-$LANG}"
export LESSCHARSET='utf-8'
export LESS='-F -R -X -g -i -S -j .5 -x 4'
export PAGER=pager
export PS_FORMAT='user,pid,pcpu,pmem,vsz,rss,sz,tty,stat,start,time,cmd'
export FIGNORE='.o:.lo:.bak:.bkp:~:.class:.pyc:CVS:.svn:make_install.cmake:MakeFiles'
export GLOBIGNORE='.o:.lo:.bak:.bkp:~:.class:CVS:.svn'
export HISTSIZE=5000
export HISTFILESIZE=999999
export HISTCONTROL=ignorespace:ignoredups
export PYTEST_ADDOPTS='--pdbcls=IPython.terminal.debugger:Pdb'
export TZ=:/etc/localtime

# aliases
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias trash='gio trash'
alias pwd='echo ${PWD}'
alias h='history'
alias ls="ls ${LS_OPTIONS}"
alias ll='ls -l'
alias la='ls -AC'
alias lh='ls -AClh'
alias lla='ls -ACl'
alias lld='ls -dCl'
alias l='ls -CF'
alias kk='kill %'
alias kkk='kill -9 %'
alias yes='echo yes'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias grep='grep --color=auto --binary-files=without-match --directories=skip'
alias make='nice -n 19 make'
alias lynx='lynx -vikeys'
alias jj='jq -C -S .'
alias jjp='jq -C -S . | less'
alias vst='vim -c "Gstatus | wincmd j | hide" .'

# customization of optional components
which git  > /dev/null && source $HOME/.bash/git
which npm  > /dev/null && source $HOME/.bash/nodejs
which go   > /dev/null && source $HOME/.bash/go
which nvim > /dev/null && source $HOME/.bash/neovim
which bat  > /dev/null && source $HOME/.bash/bat
which rg   > /dev/null && source $HOME/.bash/ripgrep
which sk   > /dev/null && source $HOME/.bash/skim
which fzf  > /dev/null && source $HOME/.bash/fzf

# functions
psg() {
	first_letter=${1:0:1}
	rest=${1:1}
	ps auxwww | egrep ^USER.\*$\|\[$first_letter\]$rest
}
psgc() {
	psg $@ | cut -c -$COLUMNS
}
envg() {
	env | grep -i "$@"
}
bhg() {
	\grep -a -h "${1}" $(\ls -tr "${HOME}/.bash_history" "${HOME}/.bash/.bash_history"*) | tail
}
bhga() {
	\grep -a -h "${1}" $(\ls -tr "${HOME}/.bash_history" "${HOME}/.bash/.bash_history"*)
}
mdstdout() {
	pandoc -s -f markdown_github -t html5 --css "file://$HOME/tmp/github-markdown.css" "${1}" | sed -e 's/^<body>$/<body class="markdown-body" style="margin: 0 auto; max-width: 50em">/'
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
findp() {
	d="${PWD}"
	while [[ ! -f "${d}/${1}" && "${d}" != "/" ]]; do
		d=$(dirname "${d}")
	done
	echo "${d}/${1}"
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
	[ -n "$TMUX" ] && {
		echo -e -n "\033]0;$1\007"
	} || {
		printf '\033k'"$@"'\033\\'
	}
}
panetitle() {
	printf '\033]2;'"$@"'\033\\'
}
n() {
	nice -n 19 "$@"
}
lbkp() {
	if [ -f "${1}" ]; then
		mv "${1}" "${1}~"
	fi
}
vimpager() {
	if [ $# = 0 ]; then
		vim -u NONE --noplugin -c 'runtime! macros/less.vim' "$@" -
	else
		vim -u NONE --noplugin -c 'runtime! macros/less.vim' "$@"
	fi
}
njp() {
	nj "$@" | vimpager -c "setfiletype json" -
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

# set $PATH
add_to_path "${HOME}/bin"
add_to_path "${HOME}/.local/bin"

if [ -n "$PS1" ]; then

	# modifiers
	set -C
	shopt -s histappend
	shopt -s globstar
	# shopt -s nullglob
	# shopt -s failglob

	# format prompt
	source "$HOME/.bash/prompt"

	# "message of the day" if any
	[ -f "${HOME}/.motd" ] && \cat "${HOME}/.motd"

	# set black cursor
	# echo -ne "\033]12;grey10\007"
fi

# load per host settings
[ -f ${HOME}/.bash/${HOST} ] && source ${HOME}/.bash/${HOST}
