cd /front/docs/

if [! -f './webhooktest/.git'];then
    git clone git@github.com:hzz520/webhooktest.git
else
    git pull origin master
fi