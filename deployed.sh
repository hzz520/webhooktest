#!/bin/sh
echo $1
cd /test/git/$1

if [ ! -d /test/git/$1 ];then
    git clone git@github.com:hzz520/$1.git
    chmod -R 777 './'
else
    git pull origin master
fi

if [ -d /test/git/$1/deployed.sh ]
   chmod +x "/test/git/$1/deployed.sh"
fi

cnpm i

if [ $1 == 'webhooktest' ]; then
   pm2 restart 'pushCode' 
   pm2 log 'pushCode'
else
    pm2 restart $1
    pm2 log $1
fi
