#!/bin/bash
#  ____ _____
# |  _ \_   _|  Derek Taylor (DistroTube)
# | | | || |    http://www.youtube.com/c/DistroTube
# | |_| || |    http://www.gitlab.com/dwt1/
# |____/ |_|
#
# Dmenu script for editing some of my more frequently edited config files.
# https://gitlab.com/dwt1/dotfiles/-/blob/1d3f422c1db5d3e95d942dff14dd059cf746dcd5/.dmenu/dmenu-edit-configs.sh

declare -a options=("kitty"
"sway"
"waybar"
"neovim"
"ssh"
"vim"
"zsh"
"dmenu-extended"
"git"
"quit"
)

# The combination of echo and printf is done to add line breaks to the end of each
# item in the array before it is piped into dmenu.  Otherwise, all the items are listed
# as one long line (one item).

choice=$(echo "$(printf '%s\n' "${options[@]}")" | dmenu -b -p 'Edit config file: ')
case "$choice" in
	quit)
		echo "Program terminated." && exit 1
	;;
	kitty)
		choice="$HOME/.config/kitty/kitty.conf"
	;;	
	dmenu-extended)
		choice="$HOME/.config/dmenu-extended/config/dmenuExtended_preferences.txt"
	;;
	sway)
		choice="$HOME/.config/sway/config"
	;;
	waybar)
		choice="$HOME/.config/waybar/config"
	;;
	zsh)
		choice="$HOME/.zshrc"
	;;
	ssh)
		choice="$HOME/.ssh/config"
	;;
	neovim)
		choice="$HOME/.config/nvim/init.vim"
	;;
	vim)
		choice="$HOME/.vimrc"
	;;
	git)
		choice="$HOME/.gitconfig"
	;;	
	*)
		exit 1
	;;
esac

# Ultimately, what do want to do with our choice?  Open in our editor!
geany "$choice"
# emacsclient -c -a emacs "$choice"

