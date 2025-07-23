#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} #if user not providing any parameter we are taking default as 14 days.

LOGS_FOLDER="/home/ec2-user/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%T)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

VALIDATE(){
    if [ $? -ne 0 ]
    then
     echo -e "$2 ... $R FAILURE $N"
     exit1
    else
     echo -e "$2 ... $R SUCCESS $N"
    fi
}

USAGE(){
    echo -e "$R USAGE:: $N sh 18-backup.sh <SOURCE_DIR> <DEST_DIR> <DAYS/OPTIONAL>"
    exit 1
}

mkdir -p /home/ec2-user/shellscript-logs/

if [ $# -lt 2 ]
then 
 USAGE
fi

echo "script started executing at:: $TIMESTAMP" &>>$LOG_FILE_NAME

if [ ! -d $SOURCE_DIR ]
then
 echo "$SOURCE_DIR Does not exist... Please check"
 exit1
fi

if [ ! -d $DEST_DIR ]
then
 echo "$DEST_DIR Does not exist .... Please check"
 exit 1
fi
