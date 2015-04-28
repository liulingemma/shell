#!/bin/bash
# load .properties file as source file

path=`dirname $0`
echo ${path}
source ${path}/install_sunjdk.properties




function download_sunjdk(){

download_sunjdk_by_ftp

}
     
function download_sunjdk_by_ftp(){
install_ftp

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
get ${jdk_installer}
close
bye
!
}
function install_ftp(){
if (test -z `rpm -qa|grep ftp`);then
chmod +x ${path}/../tools/install_ftp.sh
./${path}/../../tools/install_ftp.sh
else
echo "ftp has been installled!"
fi
}

function install_sunjdk(){
cd ${tolocalfolder}
if [ ! -d ${java_home} ];then
mkdir ${java_home}
fi
if [ ${jdk_installer_ext} = tar.gz ];then
tar -xzf  ${jdk_installer} -C ${java_home}
else 
echo "never implemented!"
 #rpm -ivh ${jdk_installer}
fi
cd -
}
config_sunjdk(){

chmod +x config_sunjdk.sh
./config_sunjdk.sh

}

download_sunjdk
install_sunjdk
config_sunjdk


