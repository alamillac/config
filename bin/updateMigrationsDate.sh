#!/bin/bash

DB_PATH='db/migrations/'
DEST_BRANCH=develop
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

FILES_TO_UPDATE=$(git diff --name-only ${DEST_BRANCH}...${CURRENT_BRANCH} ${DB_PATH})
for FILE in ${FILES_TO_UPDATE}; do
    PREFIX=$(date '+%Y%m%d%H%M%S')
    MIGRATION_BASENAME=$(echo $FILE | cut -d'/' -f3 | cut -d'-' -f2-)
    MIGRATION_NAME="${PREFIX}-${MIGRATION_BASENAME}"
    echo "Renaming ${FILE} => ${DB_PATH}${MIGRATION_NAME}"
    #mv ${FILE} ${DB_PATH}${MIGRATION_NAME}
    sleep 1.1 # To change the prefix
done