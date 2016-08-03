#!/bin/sh

test -f "${HOME}/.profile" && source "${HOME}/.profile"
test -f "${HOME}/.bashrc" -a -n "$PS1" && source "${HOME}/.bashrc"
