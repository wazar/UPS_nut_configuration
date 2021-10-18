#!/bin/sh

#Echo variable as body to email that event has occured (does this happen?)
echo "$*" | mail -s "Eishkom" mikewazar@outlook.com

#If var is emailwarn send an email warning, has never happened
#case $1 in
#                emailwarn)
#                        upsc ups \
#                        | mail -s "UPS Powering down" mikewazar@outlook.com
#                        ;;
#        esac


checkStatus=$(upsc ups 2>&1 | grep -v '^Init SSL' | grep "ups.status:")

if [ "$checkStatus" = "ups.status: OB" ]; then
       	upsc ups 2>&1 | grep -v '^Init SSL' | mail -s "UPS on battery" mikewazar@outlook.com
fi

if [ "$checkStatus" = "ups.status: OL" ]; then
        upsc ups 2>&1 | grep -v '^Init SSL' | mail -s "UPS on mains" mikewazar@outlook.com
fi
