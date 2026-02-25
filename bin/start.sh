#!/bin/sh

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
read -p "Select Environment : " INPUT_ENVIRONMENT

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
    echo "Invalid environment: $INPUT_ENVIRONMENT"
    echo "Exiting"
    exit 0
fi
    
while :
do
    echo ""
    echo "**Options**"
    echo "Selected Environment: $ENVIRONMENT"
    echo ""
    echo "1) Print timestamp"
    echo "2) Show current directory"
    echo "3) Print/Follow docker compose logs"
    echo "4) Quit"
    
    read -p "Choose option : " INPUT_OPTION
    if [[ $INPUT_OPTION -eq 1 ]]
    then
        sh -c 'trap "exit 0" INT; while true; do date; sleep 1; done'
    elif [[ $INPUT_OPTION -eq 2 ]]
    then
        pwd
    elif [[ $INPUT_OPTION -eq 3 ]]
    then
        sh -c "trap 'exit 0' INT; ./docker_compose_logs_all.sh"
    elif [[ $INPUT_OPTION -eq 4 ]]
    then
        break
    else
        echo "Invalid input: ${INPUT_OPTION}"
    fi
done