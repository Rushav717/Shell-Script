#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
 echo "error::You must have sudo access to execute the script"
 exit 1
fi

dnf list installed mysql
if [ $? -ne 0 ]
then
 dnf install mysql -y
 if [ $? -ne 0 ]
 then
  echo "Installing MYSQL is ... Failure"
  exit 1
 else
  echo "Installing MYSQL is ... Success"
 fi
else
 echo "MYSQL is already .... installed"
fi

dnf list installed git
if [ $? -ne 0 ]
then
 dnf install git -y
 if [ $? -ne 0 ]
 then 
  echo "Installing GIT is .... failure"
  exit 1 
 else
  echo "Installing GIT is .... Success"
 fi 
else
 echo "Git is already .... installed"
fi