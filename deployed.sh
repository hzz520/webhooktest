#!/bin/bash
cd /front/docs/

if [! -f './webhooktest/.git'];then
    chmod -R 777 './'
    git clone git@github.com:hzz520/webhooktest.git
else
    git pull origin master
fi