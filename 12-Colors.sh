#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"

VALIDATE()
{
 if [ $1 -ne 0 ]
 then
  echo "Installing $2 ... $R Failure"
  exit 1
 else
  echo "Installing $2 ... $G Success"
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
 echo "MYSQL is already .... $Y installed"
fi

dnf list installed git
if [ $? -ne 0 ]
then
 dnf install git -y
 VALIDATE $? "GIT"
else
 echo "Git is already .... $Y installed"
fi