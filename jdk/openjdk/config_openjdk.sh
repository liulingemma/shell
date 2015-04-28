#!/bin/bash
. install_openjdk.properties
function config_software(){
echo "export JAVA_HOME=/usr/lib/jvm/jre-${jdk_version}-openjdk" >> /etc/bashrc
echo "export CLASSPATH=.:/usr/lib/jvm/jre-${jdk_version}-openjdk/lib/dt.jar:/usr/lib/jvm/jre-${jdk_version}-openjdk/lib/tools.jar" >> /etc/bashrc
source /etc/bashrc

}

config_software
