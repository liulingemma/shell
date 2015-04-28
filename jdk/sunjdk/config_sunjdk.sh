#!/bin/bash
path=`dirname $0`
. ${path}/install_sunjdk.properties
function config_software(){
echo ${jdk_version} 
cd ${java_home}
sunjdkfolder=`find  -name jdk*${jdk_version}`
echo ${sunjdkfolder}
sunjdkfolder_name=`basename ${sunjdkfolder}`
echo ${sunjdkfolder_name} 
echo "export JAVA_HOME=${java_home}/${sunjdkfolder_name}" >> /etc/bashrc
echo "export PATH="${java_home}/${sunjdkfolder_name}/bin:$PATH"" >> /etc/bashrc
echo "export CLASSPATH="${java_home}/${sunjdkfolder_name}/lib/dt.jar:${java_home}/${sunjdkfolder_name}/lib/tools.jar"" >> /etc/bashrc

. /etc/bashrc
}

config_software
