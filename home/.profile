# .profile

umask 022;

source "${HOME}/.bash/utils"

add_to_path "${HOME}/bin"
add_to_path "${HOME}/.local/bin"

# shell-independent environment variables
export PAGER='less'
export HOST=$(hostname -s)
export EDITOR='vim'
