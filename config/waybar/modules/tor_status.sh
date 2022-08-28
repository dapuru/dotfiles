#!/bin/bash

# --------------- Settings --------------

TORPROXY=" --socks5-hostname localhost:9050 "
tor_emoji=
blinds_closed_emoji=
blinds_open_emoji=
eye_slash_emoji=
eye_emoji=

# --------------- Check command line parameter --------------

toggle_active=0

while getopts "htm:" opt; do
	case $opt in
		t)	toggle_active=1
		;;
		h) echo "De/activate Tor or get status for waybar"
	 	  	echo 'usage: tor_status [-th]'
	    	echo "Options: -t toggle status active/deactivate"
	 		echo "         -h print this help and exit"
			exit 0 ;;
	esac
done


# --------------- Show status --------------
# checks of tor is active

STATUS=$(curl $TORPROXY https://check.torproject.org/api/ip)

if [ $? -eq 0 ]; 
then 
    text="Tor connected" 
    comment="use paraemter $TORPROXY to use"
    ip=$(curl $TORPROXY ifconfig.me)
    glyph=$eye_slash_emoji
	# --------------- De/activate tor --------------
	if [ $toggle_active -eq 1 ];
	then
		sudo systemctl stop tor.service
	fi
else 
    text="Tor NOT active" 
    comment="start sevice by left-click"
    ip=$(curl ifconfig.me)
    glyph=$eye_emoji
	# --------------- De/activate tor --------------
	if [ $toggle_active -eq 1 ];
	then
		sudo systemctl start tor.service
	fi	
fi

# Format tooltip
tool_text=" $text [External IP: $ip ] "
 
# Output
echo -e "{\"text\":\""$glyph"\", \"alt\":\""$text $glyph"\", \"tooltip\":\""$tool_text"\"}"

# EOF
