#!/bin/bash

# Make the script to abort if any command fails. Use set +e to change the behaviour and ignore failed command.
set -e

echo "--- BASH INTERACTIVE DASHBOARD ---"
echo "**Select Environment**"
echo ""
echo "1) development"
echo "2) staging"
echo "3) production"
echo ""
echo "Any other key to exit"
echo ""
read -p "Environment : " INPUT_ENVIRONMENT

ENVIRONMENT="development"
if [[ $INPUT_ENVIRONMENT -eq 1 ]]
then
    ENVIRONMENT="development"
elif [[ $INPUT_ENVIRONMENT -eq 2 ]]
then
    ENVIRONMENT="staging"
elif [[ $INPUT_ENVIRONMENT -eq 3 ]]
then
    ENVIRONMENT="production"
else
    exit 0
fi
    
while :
do
    echo ""
    echo ""
    echo "**Options**"
    echo "Selected Environment: $ENVIRONMENT"
    read -p "Enter two numbers ( -1 to quit, 0 to skip ) : " a b
    if [[ $a -eq -1 ]]
    then
        break
    elif [[ $a == 0 ]]
    then
        continue
    fi
    echo "$a + $b" | bc
done