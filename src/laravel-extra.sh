#!/bin/bash

# VSCode Extension: Laravel Extra Intellisense (amiralizadeh9480.laravel-extra-intellisense)
# This shell is for creating PHP executables under Docker for the VSCode environment.
# Save to /usr/local/bin/laravel-extra and make it executable.
# VSCode setting.json -> "LaravelExtraIntellisense.phpCommand": "/usr/local/bin/laravel-extra \"{code}\"",

# Docker directory, example: /Users/<username/Website/Docker
DOCKER_COMPOSE_DIR="/path/to/Docker"

# Host project directory.
HOST_PROJECT_PATH=$(pwd)

# Project directory, if Docker is in /Users/<username/Website/Docker then project is in /Users/<username/Website/Project/
# Your app must be in /Users/<username/Website/Project/{App_1, App_2, etc...}.
# Just replace path/to/project with Website/Project/
RELATIVE_PATH="${HOST_PROJECT_PATH#*path/to/project/}"
CONTAINER_PATH="/var/www/$RELATIVE_PATH"
PHP_CODE="$1"

docker-compose -f "$DOCKER_COMPOSE_DIR/docker-compose.yml" exec -w "$CONTAINER_PATH" workspace php -r "$PHP_CODE"
