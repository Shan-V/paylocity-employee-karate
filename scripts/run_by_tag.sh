#!/bin/bash

# Clear the terminal
clear

# Check the number of arguments passed
if [ $# -eq 1 ]; then
    tag="@progress"
    env=$1
elif [ $# -eq 2 ]; then
    tag=$1
    env=$2
else
    tag="@progress"
    env="dev1"
fi

# Print the tag and environment for debugging purposes
banner="Running tests with tag: $tag and environment: $env"
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
command="mvn test -Dkarate.options=\"--tags $tag\" -Dkarate.env=$env"
stars=$(printf '%*s' "${#command}" '' | tr ' ' '=')
echo -e "\033[1;34m${stars}"
echo "${command}"
echo -e "${stars}\033[0m"
mvn test -Dkarate.options="--tags $tag" -Dkarate.env=$env
