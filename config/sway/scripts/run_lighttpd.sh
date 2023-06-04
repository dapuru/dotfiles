#!/bin/bash

if ! pgrep lighttpd >/dev/null; then
	echo "Launching lighttpd..." && sudo lighttpd -f /etc/lighttpd/lighttpd.conf
else
	echo "Killing lighttpd.." && sudo killall lighttpd
fi
