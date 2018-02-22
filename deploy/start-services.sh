#!/bin/bash
set -Eeuo pipefail

# Colors
GREEN='\033[0;32m'
RESET='\033[0m' # No Color

# Create our network, if not already exists
printf "${GREEN}Checking for docker network 'bodego-dev-network' ...${RESET}\n"
if docker network inspect bodego-dev-network > /dev/null; then
    printf "${GREEN}Network already exists, joining ...${RESET}\n"
else
    printf "${GREEN}Network doesn't exist, creating ...${RESET}\n"
    docker network create bodego-dev-network
fi

# Clean-up existing containers
docker-compose down

# Start our service
printf "${GREEN}Starting services ...${RESET}\n"
docker-compose up --build

# Clean-up
printf "${GREEN}Finished executing ...${RESET}\n"
