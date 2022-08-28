#!/bin/bash

# see https://wiki.archlinux.org/title/netctl

## CONFIG ##

TORPROXY=" --socks5 localhost:9050 --socks5-hostname localhost:9050 -s "
DEV_WIRED="enp0s31f6"
DEV_WIRELESS="wlan0"

## MENU ##

HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=4
BACKTITLE="netctl"
TITLE="Settings"
MENU="Choose one of the following options:"

OPTIONS=(1 "list netctl profiles"
         2 "wifi-menu"
         3 "tor"
         4 "analyze connection"
         5 "exit"
)

BACKTITLE_CON="choose connection"
TITLE_CON="choose connection"
MENU_CON="Choose one of the following options:"

BACKTITLE_TOR="tor"
TITLE_TOR="tor settings"
MENU_TOR="Choose one of the following options:"

OPTIONS_TOR=(1 "Service status"
         2 "Re/start service"
         3 "Stop service"
         4 "Check connection"
)

BACKTITLE_ANA="analyze connection"
TITLE_ANA="analyze connection"
MENU_ANA="Choose one of the following options:"

OPTIONS_ANA=(1 "Show external IP"
         2 "Run ethstatus"
         3 "Run netstat"
         4 "Run tshark"
)

## Start

DEV_CURRENT=$DEV_WIRED


while : ; do
CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
case $CHOICE in
        1)
            echo "Netctl Profiles in /etc/netctl/"
            sudo netctl list
            read -p "Press any key to continue... " -n1 -s
            ;;
        2)
            echo "You chose to run wifi-menu"
            sudo wifi-menu
            ;;
        3)
            # TOR
            CHOICE_TOR=$(dialog --clear \
                --backtitle "$BACKTITLE_TOR" \
                --title "$TITLE_TOR" \
                --menu "$MENU_TOR" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS_TOR[@]}" \
                2>&1 >/dev/tty)

                clear
                case $CHOICE_TOR in
                    1)
                        echo "Servie status"
                        sudo systemctl status tor.service
                        read -p "Press any key to continue... " -n1 -s
                        ;;
                    2)
                        echo "re/start tor servie"
                        sudo systemctl restart tor.service
                        read -p "Press any key to continue... " -n1 -s
                        ;;     
                    3)
                        echo "stopping tor servie"
                        sudo systemctl stop tor.service
                        read -p "Press any key to continue... " -n1 -s
                        ;;                 
                    4)
                        echo "checking tor connectivity"
                        # see https://tor.stackexchange.com/questions/12678/how-to-check-if-tor-is-working-and-debug-the-problem-on-cli
                        curl $TORPROXY https://check.torproject.org/api/ip
                        printf "\n"
                        read -p "Press any key to continue... " -n1 -s
                        ;;                                                        
                esac

            ;;
        4)
            # Analyzze connection
            CHOICE_ANA=$(dialog --clear \
                --backtitle "$BACKTITLE_ANA" \
                --title "$TITLE_ANA" \
                --menu "$MENU_ANA" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS_ANA[@]}" \
                2>&1 >/dev/tty)

                clear
                case $CHOICE_ANA in
                    1)
                        echo "Show external IP"
                        curl ifconfig.me
                        printf "\n"
                        read -p "Press any key to continue... " -n1 -s
                        ;;
                    2)
                        echo "ethstatus"
                        ethstatus -i $DEV_CURRENT
                        read -p "Press any key to continue... " -n1 -s
                        ;;     
                    3)
                        echo "netstat"
                        netstat
                        read -p "Press any key to continue... " -n1 -s
                        ;;                 
                    4)
                        echo "Run Tshark"
                        sudo tshark
                        read -p "Press any key to continue... " -n1 -s
                        ;;                                                        
                esac
            ;;
        5)
            echo "Exit"
            break
            ;;                   
esac
done
