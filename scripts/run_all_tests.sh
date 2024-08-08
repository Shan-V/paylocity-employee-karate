#!/bin/bash

# Clear the terminal
clear

# If an environment variable is provided, use it; otherwise, default to dev1
env=${1:-dev1}

# Print banner message
banner="Running all tests"
stars=$(printf '%*s' "${#banner}" '' | tr ' ' '=')
echo -e "\033[1;34m${stars}"
echo "${banner}"
echo -e "${stars}\033[0m"

# Print the actual command
command="mvn clean"
stars=$(printf '%*s' "${#command}" '' | tr ' ' '=')
echo -e "\033[1;34m${stars}"
echo "${command}"
echo -e "${stars}\033[0m"
mvn clean

# Print the actual command
command="mvn test -Dkarate.env=$env"
stars=$(printf '%*s' "${#command}" '' | tr ' ' '=')
echo -e "\033[1;34m${stars}"
echo "${command}"
echo -e "${stars}\033[0m"
mvn test -Dkarate.env=$env
