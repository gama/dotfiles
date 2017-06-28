# .profile

umask 022;

add_to_path() {
	case ":$PATH:" in
		*":$1:"*) ;;
		*)        PATH="$1:$PATH";;
	esac
}
add_to_libpath() {
	case ":$LD_LIBRARY_PATH:" in
		*":$1:"*) ;;
		*) LD_LIBRARY_PATH="$1:$LD_LIBRARY_PATH";;
	esac
	export LD_LIBRARY_PATH="${LD_LIBRARY_PATH%:}"
}

add_to_path "${HOME}/bin"
add_to_path "${HOME}/.local/bin"

# shell-independent environment variables
export PAGER='less'
export HOST=$(hostname -s)
export EDITOR='vim'
