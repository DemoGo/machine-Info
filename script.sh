#!/bin/bash

echo "welcome ! Let me show some information about your System : "

printf "number of CPU in this System : " 
grep -c processor /proc/cpuinfo

echo ""

cat /proc/meminfo | awk '/^MemTotal/{print $0}'
echo ""
echo ""

printf "Memory available :"
cat /proc/meminfo | awk '/^MemAvailable/{print $2}'
echo ""
echo ""

printf "OS "
cat /etc/*-release | awk '/^NAME/{print $0}'
echo ""
echo ""
#printf "OS v "

cat /etc/*-release | awk '/^VERSION=/{print $0}'

echo ""
echo ""
echo "Disk information : "

lsblk -o "NAME,MAJ:MIN,RM,SIZE,RO,FSTYPE,MOUNTPOINT"

echo ""
echo ""
echo "Partition wise free space available : "

df -h


echo ""
echo ""

printf "IP address : " 
curl http://myip.dnsomatic.com


echo ""
echo ""

printf "Total number of package installed : "
dpkg --list | wc --lines

top
