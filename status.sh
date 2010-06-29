# 10 Minute Drive Check
EMAIL=seanstar12@gmail.com
SPARES=0
UPTIME=`cat /proc/uptime | cut -d '.' -f1`
ZPOOL=`/sbin/zpool list`

#Check Uptime to see if it's greater than 15 min so that the pools have had time to come online
# Because Luke can't put the mount -a command in a file...

if [ "$UPTIME" -gt 900 ]; then
	echo "$ZPOOL" > /mnt/ZFS/Media/.dummy
	#Check Zpool Status to set variable for DEGRADED
	#(6/16) Added support for multiple Zpools. Alex Trebeck can suck it.
	STATUS=`/sbin/zpool list | grep -e 'DEGRADED' | awk '{print $6}'`;

	if [ "$FLAG" = "0" ]; then
		if [ "$STATUS" = "DEGRADED" ]; then 

		# Grab drive that is degraded
	        DRIVE=`/sbin/zpool status | grep -E 'UNAVAIL' | awk '{print $1}'`;

		# Grab Number of Drive from Drive_List
		NUMBER=`cat /scripts/drive_list | grep -E "$DRIVE" | awk '{print $2}'`; #Grab Number of Drive from Drive_List

		# Grab Pool Name from Driv_list
		POOL=`cat /scripts/drive_list | grep -E "$DRIVE" | awk '{print $3}'`;

		# Store email to file to send
		echo Drive $NUMBER has failed! $NUMBER is part of the $POOL where you have $SPARES Hot-Spare drives. > /tmp/drive_crash;

		# Send email of File
		mailx -s "Server Drive Degraded" $EMAIL  < '/tmp/drive_crash';

		# Set Flag for drive repair
		FLAG="1"

		# Remove the temp file
		rm -rf /tmp/drive_crash;
		fi
	fi
fi

