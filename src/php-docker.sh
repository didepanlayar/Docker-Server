#!/bin/bash

# This shell is for creating PHP executables under Docker for the VSCode environment.
# Save to /usr/local/bin/php and make it executable.

# Docker directory, example: /Users/<username/Website/Docker
DOCKER_COMPOSE_DIR="/path/to/Docker"

# Host project directory.
HOST_PROJECT_PATH=$(pwd)

# Project directory, if Docker is in /Users/<username/Website/Docker then project is in /Users/<username/Website/Project/
# Your app must be in /Users/<username/Website/Project/{App_1, App_2, etc...}.
RELATIVE_PATH="${HOST_PROJECT_PATH#*path/to/project/}"

ESCAPED_ARGS=""
for arg in "$@"; do
  ESCAPED_ARGS="$ESCAPED_ARGS \"$(printf '%q' "$arg")\""
done

COMMAND="cd $RELATIVE_PATH && php $ESCAPED_ARGS"

docker-compose -f "$DOCKER_COMPOSE_DIR/docker-compose.yml" exec workspace sh -c "$COMMAND"
