#!/bin/sh

# Make the script to abort if any command fails. Use set +e to change the behaviour and ignore failed command.
set -e

echo "--- BASH INTERACTIVE DASHBOARD ---"

ENVIRONMENT="development"
    
while :
do
    echo ""
    echo "**Options**"
    echo "Selected Environment: $ENVIRONMENT"
    echo ""
    echo "1) Pull (./docker_compose_pull.sh $ENVIRONMENT)"
    echo "2) Up - All (./docker_compose_up_all.sh $ENVIRONMENT)"
    echo "3) Up - Selected (./docker_compose_up_selected.sh $ENVIRONMENT mysql-db rabbitmq)"
    echo "4) Down - All (./docker_compose_down_all.sh $ENVIRONMENT)"
    echo "5) Down - Selected (./docker_compose_down_selected.sh $ENVIRONMENT mysql-db rabbitmq)"
    echo "6) Restart - Selected (./docker_compose_restart_selected.sh $ENVIRONMENT mysql-db rabbitmq)"
    echo "7) Status - All (./docker_compose_status_all.sh $ENVIRONMENT)"
    echo "8) Names - All (./docker_compose_list_container_names.sh $ENVIRONMENT)"
    echo "9) Logs - All (./docker_compose_logs_all.sh $ENVIRONMENT)"
    echo "10) Logs - Selected (./docker_compose_logs_selected.sh $ENVIRONMENT mysql-db rabbitmq)"
    echo "11) Logs - All (New) (./docker_compose_logs_all_new.sh $ENVIRONMENT)"
    echo "12) Logs - Selected (New) (./docker_compose_logs_selected_new.sh $ENVIRONMENT mysql-db rabbitmq)"
    echo "13) Basic cleanup (./docker_compose_basic_cleanup.sh $ENVIRONMENT)"
    echo "14) Full cleanup (./docker_compose_full_cleanup.sh $ENVIRONMENT)"
    echo "15) Change Environment"
    echo "16) Print timestamp"
    echo "17) Quit"
    
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
        sh -c "trap 'exit 0' INT; ./docker_compose_logs_all_new.sh $ENVIRONMENT"
    elif [[ $INPUT_OPTION -eq 12 ]]
    then
        ./docker_compose_list_container_names.sh $ENVIRONMENT
        printf "Enter container names separated by space (e.g., mysql-db rabbitmq): "
        read -ra INPUT_CONTAINER_NAMES
        ARGUMENT_STRING="$ENVIRONMENT ${INPUT_CONTAINER_NAMES[@]}"
        sh -c "trap 'exit 0' INT; ./docker_compose_logs_selected_new.sh ${ARGUMENT_STRING}"
    elif [[ $INPUT_OPTION -eq 13 ]]
    then
        sh -c "trap 'exit 0' INT; ./docker_compose_basic_cleanup.sh $ENVIRONMENT"
    elif [[ $INPUT_OPTION -eq 14 ]]
    then
        sh -c "trap 'exit 0' INT; ./docker_compose_full_cleanup.sh $ENVIRONMENT"
    elif [[ $INPUT_OPTION -eq 15 ]]
    then
        echo "Select Environment"
        echo ""
        echo "1) development"
        echo "2) staging"
        echo "3) production"
        echo ""
        read -p "Select Environment : " INPUT_ENVIRONMENT
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
        fi
    elif [[ $INPUT_OPTION -eq 16 ]]
    then
        sh -c 'trap "exit 0" INT; while true; do date; sleep 1; done'
    elif [[ $INPUT_OPTION -eq 17 ]]
    then
        break
    else
        echo "Invalid input: ${INPUT_OPTION}"
    fi
    echo ""
    read -n 1 -s -r -p "Command completed. Press any key to view options..."
    echo ""
done