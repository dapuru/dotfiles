#!/bin/bash
#
# Version: 0.1
# Date: 11.11.2022
# Initially Published: 20.11.2022
#
# Script to check the utilized space on mountpoints
# sends report or only alerts if value is above threshold
#
# schedule eg. via cron, anacron or similar
# or call via waybar
# #####################################################################

# Configuration
only_onperc=1      # only trigger if above threshold (1=yes, 0=no)
perc_thresh=75       # threshold for percentage used (integer)
incl_mount="/boot /home/daniel /tmp /" # include mountpoints (space separated string), empty = all
# excl_mount="/tmp" # exclude mountpoints (space separated string) - not yet implemented
MAILFILE="/tmp/df_email.tmp"  # Email Temp-file
LOGFILE="/tmp/df-log.log"     # Logfile
keep_logfile=0        # Keep Logfile or remove (1=keep, 0=remove) 
add_verbose=1         # Add verbose cmd-output to logfile
send_notification=1   # notify or not (1=yes, 0=no)
send_email=0          # send email or not (1=yes, 0=no)
host=$(hostname -s | tr '[:lower:]' '[:upper:]') # Hostname
email="" # Email for notifications

# internal Variables
i=0 # counter, what else


# --------------------- Email function ---------------------
function prepareMailContent(){
	mailSubject="$1"
	mailBody="$2"
	printf "%s\n" "To: ${email}
Subject: ${mailSubject}
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=\"$boundary\"
--${boundary}
Content-Type: text/html; charset=\"US-ASCII\"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
<html><head></head><body><pre style=\"font-size:14px; white-space:pre\">" >> $MAILFILE

	if [ -f "${mailBody}" ]; then
		less ${LOGFILE}  >> $MAILFILE
	else
		echo "${mailBody}" >> $MAILFILE
	fi

	printf "%s\n" "</pre></body></html>
--${boundary}--" >> $MAILFILE
}



# --------------------- Logic ---------------------
# Prepare logile
if [ $only_onperc -eq 1 ]; then
  echo "WARNING - The following mountpoint are running low on disk-space" >> ${LOGFILE}
else
  echo "Result of df" >> ${LOGFILE}
fi

# construct command like parameter (currently only includes)
# form: df -hP /tmp /var/log | grep -v /tmp
cparam="$incl_mount"

# build output with mountpoint and percentage
df -hP $cparam | while read -r line ; do
  perc=$(echo "$line" | awk '{print $5}')
  value=$((${perc:0:${#perc}-1})) # remove last character
  mount=$(echo "$line" | awk '{print $6}')
  # optional, only add if above threshold
  if [ $only_onperc -eq 0 ] || [ "0$(echo $value|tr -d ' ')" -gt "0$(echo $perc_thresh|tr -d ' ')" ]; then
    output="$mount - $perc" 
    echo $output >> ${LOGFILE}
    # Desktop Notification
    if [ $send_notification -eq 1 ]; then
      notify-send "WARNING - Disk low on $output"
    fi
  fi
done

# Add total output to logfile
if [ $add_verbose -eq 1 ]; then
  echo "-----------------" >> ${LOGFILE}
  df -hP $cparam >> ${LOGFILE}
fi


# --------------------- Notification email ---------------------
if [ -z "${email}" ]; then
	echo "No email address specified, information available in ${MAILFILE}"
elif [ $send_email -eq 1 ]; then
	prepareMailContent "$host - Report for for df"
	sendmail -t -oi < ${MAILFILE}
	rm ${MAILFILE} # important, otherwiese emails are sent all over again
fi


# --------------------- Remove Logfile ---------------------
if [ $keep_logfile -eq 0 ]; then
  rm ${LOGFILE} 
fi
