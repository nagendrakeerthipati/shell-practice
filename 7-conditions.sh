#!/bin/bash

if [ "$(id -u)" -eq 0 ]; then

    echo "you are using root account"
else
    echo "you need root account to access"

fi
