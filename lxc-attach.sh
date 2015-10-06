#!/bin/bash

if [[ x$2 = "x" ]]; then COMMAND="df"; else COMMAND=$2; fi

HOSTNAME=$(hostname)
CTID=$(echo $1 | sed "s/${HOSTNAME}.//")

case $COMMAND in
"df")
	/usr/bin/sudo /usr/bin/lxc-attach -n $CTID -- /usr/bin/df -P / 2>/dev/null  || \
	/usr/bin/sudo /usr/bin/lxc-attach -n $CTID -- /bin/df -P / 2>/dev/null | tail -n 1 
;;
"dfi")
	/usr/bin/sudo /usr/bin/lxc-attach -n $CTID -- /usr/bin/df -i -P / 2>/dev/null  || \
	/usr/bin/sudo /usr/bin/lxc-attach -n $CTID -- /bin/df -i -P / 2>/dev/null | tail -n 1 
;;
esac
