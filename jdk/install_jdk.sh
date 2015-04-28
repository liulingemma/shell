#!/bin/bash
path=`dirname $0`
. ${path}/install_jdk.properties
function install_java(){
if (test -z `rpm -qa|grep java`);then

if (${install_open_jdk} -eq "true");then
cd openjdk
chmod +x install_openjdk.sh
./install_openjdk.sh
else
cd sunjdk
chmod +x install_jdk.sh
./install_jdk.sh
fi
cd -
else
echo "java has been installled!"
fi
}

install_java
