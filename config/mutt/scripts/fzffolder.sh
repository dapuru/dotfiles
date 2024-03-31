#!/usr/bin/env bash
# https://github.com/neomutt/neomutt/issues/1515

fzf_command='fzf'
fd_command="fd . ${HOME}/.local/share/mail/ --type d"

folder="$($fd_command | $fzf_command)"

echo "push 'c$folder<enter>'"
