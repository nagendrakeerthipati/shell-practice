#!/bin/bash

userid=$(id -u) # Correct variable assignment (no $ outside of command substitution)

if [ "$userid" -eq 0 ]; then
    echo "You are using the root account"
else
    echo "You need root account to access"
    exit 1 # Exit code other than 0 indicates failure
fi

VALIDATE() {
    if [ $1 -eq 0 ]; then
        echo" Installing $2 is success"
    else
        echo "installing $2 is ...failure"
        exit 1
    fi
}

# we will check whithier it is installed or not
dnf list installed mysql

if [ $? -ne 0 ]; then
    echo "mysql is not  installed ...going to install it"
    dnf install mysql -y
    VALIDATE $1 "mysql"
else
    echo "mysql is already installed....nothing to do"
fi

dnf list installed python3
if [ $? -ne 0 ]; then
    echo "python3 is not  installed ...going to install it"
    dnf install python -y
    VALIDATE $1 "python3"
else
    echo "python3 is already installed....nothing to do"
fi

dnf list installed nginx
if [ $? -ne 0 ]; then
    echo "nginx is not  installed ...going to install it"
    dnf install nginx -y
    VALIDATE $1 "nginx"
else
    echo "nginx is already installed....nothing to do"
fi
