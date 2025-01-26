#!/bin/bash

# Variables
DB_CONTAINER_NAME="my_database_container"  # The name of the database container
DB_NAME="my_database"                     # The name of the SQL database
BACKUP_FILE="/home/user/app/backup/my_database_backup_20230101_120000.sql"  # Path to backup file

# Check if backup file exists
if [ ! -f "$BACKUP_FILE" ]; then
  echo "Backup file not found: $BACKUP_FILE"
  exit 1
fi

# Restore the database
docker exec -i $DB_CONTAINER_NAME /usr/bin/mysql -u root --password=root $DB_NAME < $BACKUP_FILE

# Check if restore was successful
if [ $? -eq 0 ]; then
  echo "Restore successful from $BACKUP_FILE"
else
  echo "Restore failed"
  exit 1
fi
