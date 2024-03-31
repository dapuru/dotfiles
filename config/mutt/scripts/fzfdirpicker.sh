#!/bin/sh

tmpfile=$HOME/.config/mutt/tmpfile

if \[ -z "$1" \]; then
# ranger --choosedir $tmpfile && # Use Ranger
# vifm --choose-dir $tmpfile &&    # Use Vifm
# use fzf
fzf_command='fzf'
fd_command="fd . ${HOME}/ --type d"
echo $($fd_command | $fzf_command) >$tmpfile

sed -i 's/ /^V /g' $tmpfile &&
  echo "$(awk 'BEGIN {printf "%s", "push "} {printf "%s", "<save-entry>\""$0"\"<enter>"}' $tmpfile)" >$tmpfile
elif \[ $1 == "clean" \]; then
  rm $tmpfile
fi
