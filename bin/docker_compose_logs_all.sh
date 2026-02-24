#!/bin/sh

# Make the script to abort if any command fails. Use set +e to change the behaviour and ignore failed command.
set -e

(cd .. && docker compose -f docker-compose.yml logs -t --tail all --follow)