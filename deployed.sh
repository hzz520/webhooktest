#!/bin/sh

if [ ! -d /opt/$1 ];then
    cd /opt
    git clone git@github.com:hzz520/$1.git
    chmod -R 777 './'
else
    cd /opt/$1
    git pull origin master
fi

if [ $1 == 'webhooktest' ];then
    cd /opt/$1
    cnpm i
    pm2 restart 'pushCode' 
    pm2 log 'pushCode'
elif [ -f "/opt/$1/bin/start.sh" ]
    cd /opt/$1
    cnpm i
    chmod +x "./bin/start.sh"
    ./bin/start.sh
else
fi
