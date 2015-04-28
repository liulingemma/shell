#!/bin/bash

mount -t cifs -o username=emma_1,password=tibco -l //192.168.71.83/share /share

cp /share/iso/rhel-server-7.0-x86_64-dvd.iso /usr/local/src

if [ ! -d /media/cdrom ];then
mkdir /media/cdrom
fi
mount -t iso9660 -o loop /share/iso/rhel-server-7.0-x86_64-dvd.iso  /media/cdrom

if(test -z `grep -q "/usr/local/src/rhel-server-7.0-x86_64-dvd.iso /media/cdrom iso9660 defaults,ro,loop 0 0" /etc/fstab`); then
echo "/usr/local/src/rhel-server-7.0-x86_64-dvd.iso /media/cdrom iso9660 defaults,ro,loop 0 0 is already appended to /etc/fstab"
else
echo "/usr/local/src/rhel-server-7.0-x86_64-dvd.iso /media/cdrom iso9660 defaults,ro,loop 0 0" >>/etc/fstab
fi
cd /etc/yum.repos.d/
repofile="rhel-media.repo"
if [ -f  $repofile ];then
remove $repofile
fi
touch rhel-media.repo
echo "[rhel-media]" >>rhel-media.repo
echo "name=Red Hat Enterprise Linux 7.0" >>rhel-media.repo
echo "baseurl=file:///media/cdrom" >>rhel-media.repo
echo "enabled=1" >>rhel-media.repo
echo "gpgcheck=1" >>rhel-media.repo
echo "gpgkey=file:///media/cdrom/RPM-GPG-KEY-redhat-release" >>rhel-media.repo

yum clean all
yum makecache
yum -y install httpd
systemctl enable httpd.service
systemctl start httpd.service
systemctl stop firewalld.service
systemctl disable firewalld.service