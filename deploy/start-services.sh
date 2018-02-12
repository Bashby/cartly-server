#!/bin/bash
set -Eeuo pipefail

# Colors
GREEN='\033[0;32m'
RESET='\033[0m' # No Color

# Create our network, if not already exists
printf "${GREEN}Checking for docker network ...${RESET}\n"
if docker network inspect cartly-dev-network > /dev/null; then
    printf "${GREEN}Network already exists ...${RESET}\n"
else
    printf "${GREEN}Creating docker network ...${RESET}\n"
    docker network create cartly-dev-network
fi

# Clean-up existing containers
docker-compose down

# Start our service
printf "${GREEN}Starting services ...${RESET}\n"
docker-compose up --build

# Clean-up
printf "${GREEN}Finished executing ...${RESET}\n"
