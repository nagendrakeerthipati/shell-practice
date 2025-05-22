#!/bin/bash

if [ "$(id -u)" -eq 0 ]; then
    echo "you are using root account"
else
    echo "you need root account to access"
    exit 1 #give otherthan 0 upto 127

fi
dnf install mysql -y

if [ $? -eq 0 ]; then
    echo "installing mysql is ...success"

else
    echo "installing mysql is ...failure"
    exit 1
fi
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
