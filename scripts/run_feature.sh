#!/bin/bash

# Clear the terminal
clear

# First argument is the feature file path, second is the environment
feature=${1:-""}
env=${2:-dev1}

# Print banner message
banner="Running specific feature file with environment: $env"
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

# Build the options string
options=""
if [ -n "$feature" ]; then
  options="$feature"
fi

# Print the actual command
command="mvn test -Dkarate.options=\"$options\" -Dkarate.env=$env"
stars=$(printf '%*s' "${#command}" '' | tr ' ' '=')
echo -e "\033[1;34m${stars}"
echo "${command}"
echo -e "${stars}\033[0m"
# Run the specified feature file with the specified or default environment, or all if not specified
mvn test -Dkarate.options="$options" -Dkarate.env=$env
