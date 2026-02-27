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
    echo "1) Pull"
    echo "2) Up - All"
    echo "3) Up - Selected"
    echo "4) Down - All"
    echo "5) Down - Selected"
    echo "6) Restart - Selected"
    echo "7) Status - All"
    echo "8) Names - All"
    echo "9) Logs - All"
    echo "10) Logs - Selected"
    echo "11) Print timestamp"
    echo "12) Quit"
    
    read -p "Choose option : " INPUT_OPTION
    if [[ $INPUT_OPTION -eq 1 ]]
    then
        sh -c "trap 'exit 0' INT; ./docker_compose_pull.sh $ENVIRONMENT"
    elif [[ $INPUT_OPTION -eq 2 ]]
    then
        sh -c "trap 'exit 0' INT; ./docker_compose_up_all.sh $ENVIRONMENT"
    elif [[ $INPUT_OPTION -eq 3 ]]
    then
        ./docker_compose_list_container_names.sh $ENVIRONMENT
        printf "Enter container names separated by space (e.g., mysql-db rabbitmq): "
        read -ra INPUT_CONTAINER_NAMES
        ARGUMENT_STRING="$ENVIRONMENT ${INPUT_CONTAINER_NAMES[@]}"
        sh -c "trap 'exit 0' INT; ./docker_compose_up_selected.sh ${ARGUMENT_STRING}"
    elif [[ $INPUT_OPTION -eq 4 ]]
    then
        sh -c "trap 'exit 0' INT; ./docker_compose_down_all.sh $ENVIRONMENT"
    elif [[ $INPUT_OPTION -eq 5 ]]
    then
        ./docker_compose_list_container_names.sh $ENVIRONMENT
        printf "Enter container names separated by space (e.g., mysql-db rabbitmq): "
        read -ra INPUT_CONTAINER_NAMES
        ARGUMENT_STRING="$ENVIRONMENT ${INPUT_CONTAINER_NAMES[@]}"
        sh -c "trap 'exit 0' INT; ./docker_compose_down_selected.sh ${ARGUMENT_STRING}"
    elif [[ $INPUT_OPTION -eq 6 ]]
    then
        ./docker_compose_list_container_names.sh $ENVIRONMENT
        printf "Enter container names separated by space (e.g., mysql-db rabbitmq): "
        read -ra INPUT_CONTAINER_NAMES
        ARGUMENT_STRING="$ENVIRONMENT ${INPUT_CONTAINER_NAMES[@]}"
        sh -c "trap 'exit 0' INT; ./docker_compose_restart_selected.sh ${ARGUMENT_STRING}"
    elif [[ $INPUT_OPTION -eq 7 ]]
    then
        sh -c "trap 'exit 0' INT; ./docker_compose_status_all.sh $ENVIRONMENT"
    elif [[ $INPUT_OPTION -eq 8 ]]
    then
        sh -c "trap 'exit 0' INT; ./docker_compose_list_container_names.sh $ENVIRONMENT"
    elif [[ $INPUT_OPTION -eq 9 ]]
    then
        sh -c "trap 'exit 0' INT; ./docker_compose_logs_all.sh $ENVIRONMENT"
    elif [[ $INPUT_OPTION -eq 10 ]]
    then
        ./docker_compose_list_container_names.sh $ENVIRONMENT
        printf "Enter container names separated by space (e.g., mysql-db rabbitmq): "
        read -ra INPUT_CONTAINER_NAMES
        ARGUMENT_STRING="$ENVIRONMENT ${INPUT_CONTAINER_NAMES[@]}"
        sh -c "trap 'exit 0' INT; ./docker_compose_logs_selected.sh ${ARGUMENT_STRING}"
    elif [[ $INPUT_OPTION -eq 11 ]]
    then
        sh -c 'trap "exit 0" INT; while true; do date; sleep 1; done'
    elif [[ $INPUT_OPTION -eq 12 ]]
    then
        break
    else
        echo "Invalid input: ${INPUT_OPTION}"
    fi
    echo ""
    read -n 1 -s -r -p "Command completed. Press any key to view options..."
    echo ""
done