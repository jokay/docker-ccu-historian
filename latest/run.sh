#!/bin/bash

FOLDER=/opt/ccu-historian
CONFIG=$FOLDER/config/ccu-historian.config

cd $FOLDER

if [[ ! -f "$CONFIG" ]]
then

    echo "Config file missing"

    if [[ -z "$CONFIG_CCU_TYPE" || -z "$CONFIG_CCU_IP" || -z "$CONFIG_HOST_IP" ]]
    then
        echo "Config option are missing! CONFIG_CCU_TYPE, CONFIG_CCU_IP & CONFIG_HOST_IP required."
        exit -1
    fi
    
    echo "creating config file"

    echo "devices.device1.type=$CONFIG_CCU_TYPE" > $CONFIG
    echo "devices.device1.address='$CONFIG_CCU_IP'" >> $CONFIG
    echo "devices.historianAddress='$CONFIG_HOST_IP'" >> $CONFIG
    echo "webServer.historianAddress='$CONFIG_HOST_IP'" >> $CONFIG
    
    if [ -n "$CONFIG_HOST_BINRPCPORT" ]
    then
        echo "devices.historianBinRpcPort=$CONFIG_HOST_BINRPCPORT" >> $CONFIG
    fi

    if [ -n "$CONFIG_HOST_XMLRPCPORT" ]
    then
        echo "devices.historianXmlRpcPort=$CONFIG_HOST_XMLRPCPORT" >> $CONFIG
    fi
    
    echo "database.dir='/database'" >> $CONFIG

fi

java -jar ccu-historian.jar -config $CONFIG