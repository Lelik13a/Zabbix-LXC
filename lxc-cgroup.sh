#!/bin/bash

HOSTNAME=$(hostname)

CTID=$(echo $1 | sed "s/${HOSTNAME}.//")

CGROUP="/sys/fs/cgroup/${2}/lxc/${CTID}/${3}"

if [[ -e $CGROUP ]]; then
	/bin/cat $CGROUP
fi

