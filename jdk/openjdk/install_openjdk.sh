#!/bin/bash
. install_openjdk.properties
echo "start to config the VM"
function install_software(){
os=`uname -m`
yum -y install java-${jdk_version}-openjdk.${os}
}

install_software
chmod +x config_openjdk.sh
./config_openjdk.sh
