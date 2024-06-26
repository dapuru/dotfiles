# dotfiles
My dotfiles and config for sway on arch.
- "**Sway** is a tiling Wayland compositor and a drop-in replacement for the i3 window manager for X11." (https://swaywm.org/) and it's quiet cool. Check out the Wiki at https://github.com/swaywm/sway/wiki for further details or see [Brodie Robertson - First Look At Sway WM: Welcome Home "i3"](https://www.youtube.com/watch?v=09mQAZAzwJg) for a first look.
- "**Wayland** is intended as a simpler replacement for X, easier to develop and maintain." (https://wayland.freedesktop.org/) It's the future of Linux GUIs in my opinion. For an architectural overview see https://en.wikipedia.org/wiki/Wayland_(display_server_protocol)
- "**Arch Linux** is a lightweight and flexible Linux® distribution that tries to Keep It Simple." (https://archlinux.org/) And arch is really nice, coming from Ubuntu, Suse and Co. But be careful - as in every rolling release, an update could break your system.

## Tools
|Task|Tool|
|--|--|
| WM | sway |
| Bar | waybar |
| Terminal-Font | Agave Nerd Font |
| Menu| dmenu extended |
| Notification Demon | swaync |
| Context-Menu| sgtk-menu |
| screen-lock | |
| login | greetd |
| logout | nwgbar |
| Shell | zsh |
| Finder | <a href="https://www.freecodecamp.org/news/fzf-a-command-line-fuzzy-finder-missing-demo-a7de312403ff/">fzf</a> |
| cd | <a href="https://github.com/ajeetdsouza/zoxide">zoxide</a> |
| Terminal | kitty |
| Quake-Terminal | kitty & tmux |
| Multiplexer | tmux |
| Filemanager | ranger |
| Email| neomutt (mutt-wizard) |
| Adress Book | khard, vdirsyncer |
| Calendar | khal, virdsyncer |
| Markdown | glow |
| screenshot | grim, slurp, swappy |
| screencast| wf-recorder |
| pdf-viewer | zathura |
| editor | neovim (lazyvim) |
| git | lazygit |
| diff | delta |
| music player | cmus |
| top | htop |
| ssh | none/fzf |


see also: https://www.youtube.com/watch?v=uEEHq6f8RsM <br>
and: https://dev.to/lissy93/cli-tools-you-cant-live-without-57f6 <br>
and: https://github.com/toolleeo/cli-apps

## Structure 
All dotfiles are currently just "as is", as everything is still quiet simple. Installation scripts will be located in subfolder "setup" - this is tbd.

## Howto (tbd)

Currently: Copy the files to the intended location.
Future - Installation: The script bootstrap_system.sh in folder "setup" (which calls apt.exclude.sh) installs needed software after a system-reset. Steps:


    git clone Repository-URL
    cd setup
    ./setup/bootstrap_system.sh


For configuration via dotfiles: Create a folder called "dotfiles" in you home-directory, cd there and run the script "install_dotfiles.sh". This script clones this repo and symlinks all dotfiles in the root-folder to your home directory.

Some software, however, needs to be installed manually, eg Eclipse, RStudio,..

## General links to dotfiles
https://dotfiles.github.io/ <br>
https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789<br>

## Other repos 
https://github.com/holman/dotfiles<br>
https://github.com/webpro/awesome-dotfiles <br>
https://github.com/holman/dotfiles <br>
https://github.com/blinry/dotfiles <br>
https://github.com/mathiasbynens/dotfiles<br>

## Other sway repos:
https://github.com/maximbaz/dotfiles/<br>

## Keybindings
all is vim: https://github.com/erikw/vim-keybindings-everywhere-the-ultimate-list


