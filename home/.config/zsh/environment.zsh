export LS_OPTIONS='-F --group-directories-first -I CVS -I .svn -I \*.lo -I \*.o -I \*.la -I CMakeFiles -I cmake_install.cmake -I CMakeCache.txt -I \*.pyc --color=auto --quoting-style=literal'
export LS_COLORS='di=01;34:ex=00;32:ln=00;36:mi=01;41:ow=01;04;32'
export GREP_COLORS="mt=01;43"; 
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
export KEYTIMEOUT=1
