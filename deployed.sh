#!/bin/bash
cd /test/git/$1

if [! ls './$1/.git'];then
    chmod -R 777 './'
    git clone git@github.com:hzz520/webhooktest.git
else
    git pull origin master
fi

cnpm i
pm2 restart 
