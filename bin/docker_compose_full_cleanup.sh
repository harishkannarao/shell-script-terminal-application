#!/bin/sh

# Make the script to abort if any command fails. Use set +e to change the behaviour and ignore failed command.
set -e

ENVIRONMENT="$1"

(cd .. && docker compose -f docker-compose.yml --env-file ./env_config/${ENVIRONMENT}.env down -v)

(cd .. && docker compose -f docker-compose.yml --env-file ./env_config/${ENVIRONMENT}.env rm -f -s -v)

docker image prune --all --force

docker system prune --all --volumes --force