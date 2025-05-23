#!/bin/bash
# chcking the user is having root acess or not
userid = $(id -u)
if [ userid -eq 0 ]; then
    echo "you are using root account"
else
    echo "you need root account to access"
    exit 1 #give otherthan 0 upto 127

fi

# we will check whithier it is installed or not
dnf list installed mysql

if [ $? -eq 0 ]; then
    echo "mysql is already  installed ... nothing do"

else
    dnf install mysql -y
    echo "installing mysql is ...success"

    exit 1
fi

# if [ $? -eq 0 ]; then

# else
#     echo "installing mysql is ...failure"
#     exit 1
# fi
# #!/bin/bash

# # Check if user is root
# if [ "$(id -u)" -ne 0 ]; then
#     echo "You need root account to access"
#     exit 1
# else
#     echo "You are using root account"
# fi

# # Install MySQL
# dnf install mysql -y

# # Check if installation was successful
# if [ $? -eq 0 ]; then
#     echo "Installing MySQL was successful"
# else
#     echo "Installing MySQL failed"
#     exit 1
# fi
