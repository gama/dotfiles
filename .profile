# .profile

umask 022;

add_to_path() {
	case ":$PATH:" in
		*":$1:"*) ;;
		*)        PATH="$1:$PATH";;
	esac
}
add_to_path "${HOME}/bin"

# shell-independent environment variables
export PAGER='less'
export HOST=$(hostname -s)
export EDITOR='vim'
