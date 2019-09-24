#!/bin/bash
cd /test/git/$1

echo "$1"

if [! ls './.git'];then
    echo 'no'
    chmod -R 777 './'
    git clone git@github.com:hzz520/webhooktest.git
else
    echo 'yes'
    git pull origin master
fi

cnpm i
pm2 restart $1 
