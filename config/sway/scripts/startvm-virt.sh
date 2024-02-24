#!/bin/bash
# start vm and connect to it in fullscreen
virsh start "$1"
virt-viewer -w -a "$1"
