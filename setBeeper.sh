#!/bin/bash

#Variables
#Set current output
output=$(upsc ups 2>&1 | grep -v '^Init SSL' | grep "ups.beeper.status")

#Set expected
expected="ups.beeper.status: enabled"

if [ "$output" == "$expected" ]; then
	sudo upscmd  -u admin -p <PASSWORD> ups beeper.toggle
else
	exit
fi
