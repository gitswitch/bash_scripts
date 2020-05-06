#!/bin/bash

#This script shows the  open network ports on a system.
#Use -4 as an argument to limit to tcp4 ports.
#Can use grep -Ev '^Active|^Proto' to isolate the first 2 lines

netstat -nutl ${1} | grep ':' | awk '{print $4}' | awk -F ':' '{print $NF}'
 
LOG_FILE="${1}"

if [[ ! -e "${LOG_FILE}" ]]
then
	echo "Cannot open ${LOG_FILE}" >&2
	exit 1
fi

cut -d '"' -f 2 ${LOG_FILE} | cut -d ' ' -f 2 | sort | uniq -c | sort -n | tail -3

