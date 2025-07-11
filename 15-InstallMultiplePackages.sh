#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"

Logs_Folder="/var/log/shellscript-logs"
Log_file=$(echo $0 | cut -d "." -f1)
Timestamp=$(date +%Y-%m-%d-%H-%M-%S)
Log_File_Name="$Logs_Folder/$Log_file-$Timestamp.log"

VALIDATE()
{
 if [ $1 -ne 0 ]
 then
  echo -e "Installing $2 ... $R Failure"
  exit 1
 else
  echo -e "Installing $2 ... $G Success"
 fi
}

echo "Time of script Executed at:: $Timestamp" &>> $Log_File_Name

if [ $USERID -ne 0 ]
then
 echo "error::You must have sudo access to execute the script"
 exit 1
fi

for package in $@
do
    dnf list installed $package &>> $Log_File_Name
    if [ $? -ne 0]
    then
     dnf install $package -y $Log_File_Name
     VALIDATE $? "$package"
    else
     echo "$package is already ... $Y Installed"
    fi
done