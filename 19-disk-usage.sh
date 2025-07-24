#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=5
while read -r line
do
 echo $line
 USAGE=$(echo $0 | awk -F " " '{print $6F}')
 PARTITION=$(echo $0 | awk -F " " '{print $NF}')
 echo "partition: $PARTITION, USAGE: $USAGE"
done <<< $DISK_USAGE


