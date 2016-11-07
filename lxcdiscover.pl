#!/usr/bin/perl

use strict;

my $first = 1;

print "{\n";
print "\t\"data\":[\n\n";

my $VEname = `hostname`;
#cut end string
$VEname = substr($VEname, 0, -1);

#my $lxcresult = `/usr/bin/lxc-ls -1`;
my $lxcresult = `/usr/bin/find /sys/fs/cgroup/cpuacct/lxc/ -maxdepth 1 -mindepth 1 -type d -printf '%f\n'`;

my @lines = split /\n/, $lxcresult;
foreach my $l (@lines) {
                my $id = $l;
		my @stat = split / +/, `/usr/bin/lxc-info -s -n $id`;
		my $status = substr($stat[1], 0, -1);

                print ",\n" if not $first;
                $first = 0;

                print "\t{\n";
                print "\t\t\"{#CTID}\":\"$id\",\n";
                print "\t\t\"{#CTSTATUS}\":\"$status\",\n";
                print "\t\t\"{#VENAME}\":\"$VEname\"\n";
                print "\t}";
}

print "\n\t]\n";
print "}\n";

