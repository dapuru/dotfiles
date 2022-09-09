#!/bin/bash
# small script to enable root access to x-windows system
# https://www.reddit.com/r/Fedora/comments/5eb633/solution_running_graphical_app_with_sudo_in/
xhost +SI:localuser:root  
sudo $1  
#disable root access after application terminates
xhost -SI:localuser:root  
#print access status to allow verification that root access was removed
xhost  