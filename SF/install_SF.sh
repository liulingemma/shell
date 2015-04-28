#!/bin/bash
# load .properties file as source file

path=`dirname $0`
echo ${path}
source ${path}/install_SF.properties




function download_silverfabric(){

download_silverfabric_by_ftp

}
   
function download_silverfabric_by_ftp(){
install_ftp
echo ${remoteserver}
if [ ! -d  ${tolocalfolder} ];then
mkdir ${tolocalfolder}
fi
ftp -n<<!
open ${remoteserver}
user ${username} ${password}
binary
cd ${sharefolder}

lcd ${tolocalfolder}
prompt
get ${silverfabric_package}
close
bye
!
}
function install_ftp(){
if (test -z `rpm -qa|grep ftp`);then
chmod +x ${path}/../tools/install_ftp.sh
./${path}/../tools/install_ftp.sh
else
echo "ftp has been installled!"
fi
}

function install_silverfabric(){
cd ${sharefolder}
if [ ! -d ${silverfabric_home} ];then
mkdir ${silverfabric_home}
fi
tar -xzf  ${silverfabric_package} -C ${silverfabric_home}
cd ${silverfabric_home}/fabric
./server.sh start
}

#download_silverfabric
install_silverfabric

