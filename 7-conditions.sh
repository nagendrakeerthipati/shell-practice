#!/bin/bash

if [ "$(id -u)" -eq 0 ] then

    echo "you are using root account"
    exit 1 #give otherthan 0 upto 127
else
    echo "you need root account to access"

fi
dnf install mysql -y

if [ $? -eq 0 ]
then
    echo "installing mysql is ...success"
else
    echo "installing mysql is ...failure"
    exit 1
fi
