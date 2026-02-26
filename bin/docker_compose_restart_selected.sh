#!/bin/sh

# Make the script to abort if any command fails. Use set +e to change the behaviour and ignore failed command.
set -e

ENVIRONMENT="$1"

CONTAINER_NAMES=("${@:2}")

(cd .. && docker compose -f docker-compose.yml --env-file ./env_config/${ENVIRONMENT}.env restart "${CONTAINER_NAMES[@]}")