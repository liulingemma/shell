#!/bin/bash
path=`dirname $0`
. ${path}/install_ftp.properties
echo "start to config the VM"
function install_software(){
os=`uname -m`
yum -y install $1.${os}
}


install_software ftp
