#!/bin/bash

USERID=$(id -u)

VALIDATE()
{
 if [ $1 -ne 0 ]
 then
  echo "Installing $2 ... Failure"
  exit 1
 else
  echo "Installing $2 ... Success"
 fi
}

if [ $USERID -ne 0 ]
then
 echo "error::You must have sudo access to execute the script"
 exit 1
fi

dnf list installed mysql
if [ $? -ne 0 ]
then
 dnf install mysql -y
 VALIDATE $? "MYSQL"
else
 echo "MYSQL is already .... installed"
fi

dnf list installed git
if [ $? -ne 0 ]
then
 dnf install git -y
 VALIDATE $? "GIT"
else
 echo "GIT is already .... installed"
fi