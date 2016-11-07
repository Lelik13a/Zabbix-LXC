#!/bin/bash

if [[ x$2 = "x" ]]; then COMMAND="df"; else COMMAND=$2; fi

HOSTNAME=$(hostname)
CTID=$(echo $1 | sed "s/${HOSTNAME}.//")
STATUS=$(/usr/bin/sudo /usr/bin/lxc-info -s -n $CTID | awk '{print $2}')

if [[ $STATUS = "STOPPED" ]]; then exit 0; fi

case $COMMAND in
"df")
	/usr/bin/sudo /usr/bin/lxc-attach -n $CTID -- /usr/bin/df -P / 2>/dev/null  || \
	/usr/bin/sudo /usr/bin/lxc-attach -n $CTID -- /bin/df -P / 2>/dev/null  
;;
"dfi")
	/usr/bin/sudo /usr/bin/lxc-attach -n $CTID -- /usr/bin/df -i -P / 2>/dev/null  || \
	/usr/bin/sudo /usr/bin/lxc-attach -n $CTID -- /bin/df -i -P / 2>/dev/null 
;;
esac
