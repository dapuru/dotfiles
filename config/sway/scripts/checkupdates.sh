#!/usr/bin/env bash

#  Run '/usr/bin/checkupdates' to get a count of the number of pending package
#  updates. If the number is 20 or greater, or a kernel update is pending, print
#  the number of updates to the statusbar and send a pop-up notification.
#  Otherwise, exit silently.
# from https://bbs.archlinux.org/viewtopic.php?id=184002
# prerequisite: install pacman-contrib

pkg=$(checkupdates | wc -l)
kernel=$(checkupdates | grep -c ^linux)

if [ "$pkg" -lt 20 ] && [ "$kernel" -eq 0 ]; then
    exit 0
elif [ "$pkg" -ge 20 ] || [ "$kernel" -ge 1 ]; then
    if [ "$kernel" -ge 1 ]; then
        notify-send -u critical --icon=software-update-urgent "Pending updates: $pkg AND Kernel " " $(checkupdates)";
        echo "PACKAGES: [ $pkg ]"
    else
        notify-send -u normal --icon=software-update-available "Pending updates: $pkg no kernel" " $(checkupdates)";
        echo "PACKAGES: [ $pkg ]"
    fi
fi