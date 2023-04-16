#!/usr/bin/env bash

#  Run '/usr/bin/checkupdates' to get a count of the number of pending package
#  updates.
# idea based on:
# from https://bbs.archlinux.org/viewtopic.php?id=184002
# prerequisite: install pacman-contrib

pkg=$(checkupdates | wc -l)
kernel=$(checkupdates | grep -c ^linux)

if [ "$kernel" -eq 0 ]; then
    msg="(No kernel)"
    msg_short="(No kernel)"
elif [ "$kernel" -ge 1 ]; then
    msg="(This includes a Kernel update!)"
    msg_short="(Kernel!)"
fi

dialog --title "$pkg Updates available ($msg_short)" --extra-button --extra-label "Show packages" --yesno "There are $pkg updates avaiables $msg. Do you want to continue to update the system? \n\n $(checkupdates)" 15 60
ANTWORT=${?}
    if [ "$ANTWORT" -eq "0" ]
    then
        echo "Update"
        sudo pacman -Syu
        echo "Update complete."
        dialog --title "yay" --yesno "Do you also want to update AUR (yay)?" 15 60
        ANTWORT=${?}
        if [ "$ANTWORT" -eq "0" ]
        then
            yay
        else
            echo "No yay update."
        fi
        dialog --title "3rd party" --yesno "Do you also want to update other 3rd party (scripts)?" 15 60
        ANTWORT=${?}
        if [ "$ANTWORT" -eq "0" ]
        then
            /home/daniel/Documents/scripts/helper/updateother.sh
        else
            echo "No 3rd party update."
        fi
    elif [ "$ANTWORT" -eq "3" ]
	then
        echo "PACKAGES: [ $pkg ] $(checkupdates)"
    else
        echo "Nothing updated.."
        exit 0
    fi
