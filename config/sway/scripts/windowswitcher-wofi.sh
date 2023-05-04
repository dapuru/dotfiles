#!/bin/sh
# Window switcher using wofi
# https://man.archlinux.org/man/wofi.7.en
swaymsg -t get_tree | jq -r '.nodes[].nodes[] | if .nodes then [recurse(.nodes[])] else [] end + .floating_nodes | .[] | select(.nodes==[]) | ((.id | tostring) + " " + .name)' |
wofi --show dmenu | { 
    read -r id name 
    swaymsg "[con_id=$id]" focus 
    }
