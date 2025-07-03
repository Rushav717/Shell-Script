#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
 echo "Error:: the user is not root user"
 exit 1
fi

dnf install mysqll -y

dnf install git -y