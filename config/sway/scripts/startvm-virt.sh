#!/bin/bash
# start vm and connect to it - unfortunally -f for fullscreen doesn't work
virsh start "$1"
virt-viewer -w -a --hotkeys=toggle-fullscreen=shift+f,release-cursor=shift+r "$1"
