#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

Source_DIR="/home/ec2-user/app-logs"

LOG_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%T)
LOG_FILE_NAME="$LOG_FOLDER/$LOG_FILE-$TIMESTAMP.log"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
      echo -e "$2 ... $R FAILURE $N"
      exit 1
    else
      echo -e "$2 ... $G Success $N"
    fi
}


CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
      echo "ERROR:: Sudo access is Required to execute the script"
      exit 1
    fi
}

echo "Script Started excecuted at: $TIMESTAMP" &>>$LOG_FILE_NAME

CHECK_ROOT

LOGFILES_TO_DELETE=$(find $Source_DIR -name "*.log" -mtime +14)

echo "logfiles to be deleted: $LOGFILES_TO_DELETE" 

while read -r file
do
 echo "deleting files: $file"
 rm -rf $file
done <<< $LOGFILES_TO_DELETE
