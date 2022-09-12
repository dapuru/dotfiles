# dotfiles
My dotfiles and config for sway on arch.
- "Sway is a tiling Wayland compositor and a drop-in replacement for the i3 window manager for X11." (https://swaywm.org/) and it's quiet cool.
- "Wayland is intended as a simpler replacement for X, easier to develop and maintain." (https://wayland.freedesktop.org/) It's the future of Linux GUIs in my opinion.
- "Arch Linux is a lightweight and flexible Linux® distribution that tries to Keep It Simple." (https://archlinux.org/) And arch is really nice, coming from Ubuntu, Suse and Co.

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
