silent! %s/\%(\e\[[0-9;]*m\|\r$\)//g
setlocal readonly nomodifiable noswapfile autoread foldmethod=syntax
