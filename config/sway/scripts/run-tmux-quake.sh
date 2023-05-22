#!/bin/sh
tmux new-session -d -s 'Quake' -n 'kitty'
#tmux split-window -h 'htop'
tmux new-window 'htop'
tmux new-window 'cmus'
tmux selectw -t 1
tmux -2 attach-session -d
