#!/bin/bash
# load .properties file as source file
. install_Engine.properties

echo "start to config the VM"

function download_Engine(){
wget ${engine_download_url}${DSEngine_installer}
}
function configure_Engine(){
cd ${Engine_home}/DSEngine
chmod +x configure.sh

./configure.sh -s ${sf_server}

}
function install_Engine(){

if [ ! -d ${Engine_home} ];then
mkdir ${Engine_home}
fi
tar -xzf ${DSEngine_installer} -C ${Engine_home}

}
download_Engine
install_Engine
configure_Engine

