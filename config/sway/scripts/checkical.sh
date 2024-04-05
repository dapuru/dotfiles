#!/bin/bash

# sync contacts and appointments
vdirsyncer sync

# send notification for today & tomorrow
khal list today >/tmp/ical.txt
notify-send "Next Events" "$(cat /tmp/ical.txt)"
