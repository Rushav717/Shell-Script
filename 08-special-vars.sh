#!/bin/bash

echo "All variables passed: $@"
echo "Number of Variables: $#"
echo "Script name: $0"
echo "present working directory: $PWD"
echo "Home directory of current user: $HOME"
echo "Which User is running the script: $USER"
echo "Processid of current script: $$"

sleep 60 &
echo "Processid of last command in background: $!"