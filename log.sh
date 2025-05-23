#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[om"

userid=$(id -u) # Correct variable assignment (no $ outside of command substitution)

if [ "$userid" -eq 0 ]; then
    echo -e "You are using the root account"
else
    echo "You need root account to access"
    exit 1 # Exit code other than 0 indicates failure
fi

VALIDATE() {
    if [ $1 -eq 0 ]; then
        echo -e "$G Installing $2 is success $N"
    else
        echo "$R installing $2 is ...failure $N"
        exit 1
    fi
}

# we will check whithier it is installed or not
dnf list installed mysql

if [ $? -ne 0 ]; then
    echo "$R mysql is not  installed ...going to install it $N" | tee -a $LOG_FILE
    dnf install mysql -y | tee -a $LOG_FILE
    VALIDATE $? "mysql"
else
    echo "$G mysql is already installed....nothing to do $N" | tee -a $LOG_FILE
fi

dnf list installed python3
if [ $? -ne 0 ]; then
    echo "$R python3 is not  installed ...going to install it $N" | tee -a $LOG_FILE
    dnf install python -y | tee -a $LOG_FILE
    VALIDATE $? "python3"
else
    echo "$Y python3 is already installed....nothing to do $N" | tee -a $LOG_FILE
fi

dnf list installed nginx
if [ $? -ne 0 ]; then
    echo "$R nginx is not  installed ...going to install it $N" | tee -a $LOG_FILE
    dnf install nginx -y | tee -a $LOG_FILE
    VALIDATE $? "nginx"
else
    echo "$G nginx is already installed....nothing to do $N" | tee -a $LOG_FILE
fi
