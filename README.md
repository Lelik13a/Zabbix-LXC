# Description
LXC node monitoring through Zabbix.

LXC containers monitoring through Zabbix.

Template "Template LXC Node" finds all containers, creates new hosts and apply template "Template LXC CT" on them.

# Dependencies
perl, sudo, zabbix-agent.

Installation
============
1. copy lxcdiscover.pl, lxc-attach.sh,  lxc-cgroup.sh, and  lxc-info.sh to /etc/zabbix/
2. copy zabbix_agentd.d/lxc.conf to /etc/zabbix/zabbix_agentd.d/
3. copy sudoers.d/zabbix to /etc/sudoers.d/
4. chown root:root /etc/sudoers.d/zabbix ; chmod 440 /etc/sudoers.d/zabbix
5. chmod 755 /etc/zabbix/lxcdiscover.pl /etc/zabbix/lxc-attach.sh  /etc/zabbix/lxc-cgroup.sh  /etc/zabbix/lxc-info.sh
6. restart zabbix-agent daemon.
7. import "zbx_templates/Template LXC CT.xml" and "zbx_templates/Template LXC Node.xml" into your templates.
8. apply template "Template LXC Node" to LXC hardware node (otherwise known as host system).
9. enjoy.


PS
===========
If you have problem with import template "Template LXC Node.xml", try use template without discovery rule and add it later manually.
https://github.com/Lelik13a/Zabbix-OpenVZ/issues/2
