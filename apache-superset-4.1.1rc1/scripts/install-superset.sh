#!/bin/bash

# Determine the directory where the script resides
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Move to the superset-frontend directory and execute the necessary commands
cd "$SCRIPT_DIR/../superset-frontend/packages/generator-superset/custom_plugins/superset-custom-table-downtime-breakdown" && npm i && npm run build
cd "$SCRIPT_DIR/../superset-frontend/packages/generator-superset/custom_plugins/superset-plugin-table-extension" && npm i && npm run build
cd "$SCRIPT_DIR/../superset-frontend/packages/generator-superset/custom_plugins/superset-plugin-table-popup-button" && npm i && npm run build
 cd "$SCRIPT_DIR/../superset-frontend/" && npm i --f

# Move back to the directory containing the script and execute docker-compose command
cd "$SCRIPT_DIR"
TAG=3.0.0 docker-compose -f $SCRIPT_DIR/../docker-compose-non-dev.yml up -d
