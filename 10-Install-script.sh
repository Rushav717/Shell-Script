#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
 echo "Error:: the user is not root user"
fi

dnf install mysqll -y

dnf install git -y