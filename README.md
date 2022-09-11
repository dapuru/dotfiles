# dotfiles
My dotfiles and config for sway on arch

## Structure All dotfiles are currently directly in the root-folder, as everything is still quiet simple. Installation scripts are located in subfolder "setup" - this is tbd.

## Howto (tbd)

Installation: The script bootstrap_system.sh in folder "setup" (which calls apt.exclude.sh) installs needed software after a system-reset. Steps:

    git clone Repository-URL
    cd setup
    ./bootstrap_system.sh

For configuration via dotfiles: Create a folder called "dotfiles" in you home-directory, cd there and run the script "install_dotfiles.sh". This script clones this repo and symlinks all dotfiles in the root-folder to your home directory.

Some software, however, needs to be installed manually, eg Eclipse, RStudio,..

## General links to dotfiles
https://dotfiles.github.io/ 
https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789

## Other repos 
https://github.com/holman/dotfiles
https://github.com/webpro/awesome-dotfiles 
https://github.com/holman/dotfiles 
https://github.com/blinry/dotfiles 
https://github.com/mathiasbynens/dotfiles

## Other sway repos:
https://github.com/maximbaz/dotfiles/
