#!/bin/bash

DCF_PATH="/service/docker"
DCF_FILE="$DCF_PATH/docker-compose.yml"
LOG_FILE="$DCF_PATH/logs/clear-log.sh"

/usr/local/bin/docker-compose -f "$DCF_FILE" down -v
bash "$LOG_FILE"
/usr/local/bin/docker-compose -f "$DCF_FILE" up -d
