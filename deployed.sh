#!/bin/bash
echo $1
cd /test/git/$1

if [ ! -d /test/git/$1 ];then
    git clone git@github.com:hzz520/$1.git
    chmod -R 777 './'
else
    git pull origin master
fi

cnpm i

if [ $1 === 'webhooktest' ]; then
   pm2 restart 'pushCode' 
   pm2 log 'pushCode'
else
    pm2 restart $1
    pm2 log $1
fi