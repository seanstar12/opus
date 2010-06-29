#!/bin/sh
# Daily Report

EMAIL=seanstar12@gmail.com;
MONTH=`date | awk '{print $2}'`
DATE=`date | awk '{print $3"-"$1}'`
DIRECTORY=/scripts/files/$MONTH

# Check to see if MONTH directory exists
if [ ! -d "$DIRECTORY" ]; then
	# If not, create it
	mkdir $DIRECTORY;
fi
	# Run commands and pipe them to archive
	echo "`date`\n`uptime`\n\n`/sbin/zpool list`\n\n`vnstat -h`" > /scripts/files/$MONTH/$DATE;

	# Email archived file as message
	mailx -s "Daily Status Report" $EMAIL < /scripts/files/$MONTH/$DATE;

	REPORT=`/sbin/zpool list -H`;

	google calendar add "$REPORT";
