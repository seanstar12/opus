#!/bin/sh
# Script to check smart status of drives
# First line overwrites; the rest append
	smartctl /dev/sdb -H | grep -e 'overall-health' | awk '{print "sdb " $6}' > /scripts/smart_status
	smartctl /dev/sdc -H | grep -e 'overall-health' | awk '{print "sdc " $6}' >> /scripts/smart_status
	smartctl /dev/sde -H | grep -e 'overall-health' | awk '{print "sde " $6}' >> /scripts/smart_status
	smartctl /dev/sdf -H | grep -e 'overall-health' | awk '{print "sdf " $6}' >> /scripts/smart_status
	smartctl /dev/sdg -H | grep -e 'overall-health' | awk '{print "sdg " $6}' >> /scripts/smart_status
	smartctl /dev/sdh -H | grep -e 'overall-health' | awk '{print "sdh " $6}' >> /scripts/smart_status
	smartctl /dev/sdi -H | grep -e 'overall-health' | awk '{print "sdi " $6}' >> /scripts/smart_status
	smartctl /dev/sdj -H | grep -e 'overall-health' | awk '{print "sdj " $6}' >> /scripts/smart_status
	smartctl /dev/sdk -H | grep -e 'overall-health' | awk '{print "sdk " $6}' >> /scripts/smart_status
	smartctl /dev/sdl -H | grep -e 'overall-health' | awk '{print "sdl " $6}' >> /scripts/smart_status
	smartctl /dev/sdm -H | grep -e 'overall-health' | awk '{print "sdm " $6}' >> /scripts/smart_status
