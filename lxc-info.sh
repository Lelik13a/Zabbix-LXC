#!/bin/bash

HOSTNAME=$(hostname)

CTID=$(echo $1 | sed "s/${HOSTNAME}.//")

/usr/bin/sudo /usr/bin/lxc-info -H -n "$CTID" 

