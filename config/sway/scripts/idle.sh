#!/bin/sh
swayidle \
timeout 180 '~/.config/sway/scripts/lock.sh --grace 10' \
timeout 600 'swaymsg "output * dpms off"' \
resume 'swaymsg "output * dpms on"' \
before-sleep '~/.config/sway/scripts/lock.sh'
