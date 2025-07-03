#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
 echo "Error:: the user is not root user"
 exit 1
fi

dnf install mysql -y
if [ $? -ne 0 ]
then
 echo "MYSQL installation is ... Failure"
 exit 1
else
 echo "MySQL installation is ... Success"
fi

dnf install git -y
if [ $? -ne 0 ]
then
 echo "Git installation is ... Failure"
 exit 1
else
 echo "Git installation is ... Success"
fi