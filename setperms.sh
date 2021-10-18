#!/bin/bash
    # make sure that conffiles are secured and have the correct ownerships
    # on first install
    if [ -z "$2" ] ; then
        if [ -d /etc/nut/ ] ; then
          chown root:nut /etc/nut/
        fi
        for file in ups.conf upsd.conf upsd.users ; do
            if [ -f /etc/nut/$file ] ; then
                chown root:nut /etc/nut/$file
                chmod 640 /etc/nut/$file
            fi
        done
    fi