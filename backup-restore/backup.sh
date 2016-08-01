#!/bin/sh

script_root_dir=`dirname "$0"`
config="$script_root_dir/backup-restore.config"
site_path="$1"

if [ -z "$site_path" ]
then
  echo "Usage: $0 /path/to/your/site"
  exit 1
fi

last_backup_time=$(date "+%Y-%m-%d-%H-%M-%S")
backup_file_name="$last_backup_time-DB.sql"

if [ -f "$config" ]
then
  . "$config"
else
  echo "--------------"
  echo "Sorry, I couldn't find a 'backup-restore.config' file. Copy backup-restore.config.example to backup-restore.config and fill in all the required information inside to continue."
  echo "--------------"
  exit 2
fi

echo '--------'
echo 'Starting Database backup (WP-CLI export)'
echo '--------'

# Create a Directory with the current timestamp so older backups are easier to find.
mkdir -p "$backup_dir/older/$last_backup_time"

# Export the database as 'latest'. If the export is successfull, copy the sql file to its respective timestamp directory.
wp --path="$site_path" db export "$backup_dir/latest-db-dump.sql"

if [ $? -eq 0 ]
then
  echo "***** Done! The database was exported successfully."
  cat "$backup_dir/latest-db-dump.sql" | gzip "$backup_dir/older/$last_backup_time/$backup_file_name"
else
  echo "***** The database could not be exported. Stopping.."
  exit 3
fi

echo '--------'
echo 'Starting file backup'
echo '--------'

# Archive all site files to a tar.gz and if successfull, copy the archive to its respective timestamp directory.
tar -vczf "$backup_dir/latest-files-backup.tar.gz" "$site_path"
if [ $? -eq 0 ]
then
  cp "$backup_dir/latest-files-backup.tar.gz" "$backup_dir/older/$last_backup_time/$last_backup_time-files.tar.gz"
  echo "***** Done! All site files were archived successfully."
else
  echo "***** There was a problem while archiving the site files. Stopping.."
  exit 4
fi

echo '--------'
echo 'All good, backup complete.'
echo '--------'
echo 'You can find the archived files in ' $backup_dir
