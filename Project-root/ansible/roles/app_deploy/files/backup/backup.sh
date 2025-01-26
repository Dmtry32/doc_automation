#!/bin/bash

# Variables
DB_CONTAINER_NAME="my_database_container"  # The name of the database container
DB_NAME="my_database"                     # The name of the SQL database
BACKUP_DIR="/home/user/app/backup"        # Directory where the backup will be stored
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="${BACKUP_DIR}/${DB_NAME}_backup_${TIMESTAMP}.sql"

# Create backup directory if it doesn't exist
mkdir -p $BACKUP_DIR

# Perform the backup
docker exec $DB_CONTAINER_NAME /usr/bin/mysqldump -u root --password=root $DB_NAME > $BACKUP_FILE

# Check if backup was successful
if [ $? -eq 0 ]; then
  echo "Backup successful: $BACKUP_FILE"
else
  echo "Backup failed"
  exit 1
fi
