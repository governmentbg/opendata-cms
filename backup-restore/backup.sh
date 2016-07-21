#!/bin/sh
config="./backup-restore.config";
last_backup_time=$(date "+%Y-%m-%d-%H-%M-%S");
backup_file_name="$last_backup_time-DB.sql";

if [ -f "$config" ]
then
  . $config; #if backup-restore.config is present, use it as source
else
  echo "--------------"
  echo "Sorry, I couldn't find a 'backup-restore.config' file. Copy backup-restore.config.example to backup-restore.config and fill in all the required information inside to continue.";
  echo "--------------"
  exit 0;
fi

echo '--------';
echo 'Starting Database backup (WP-CLI export)';
echo '--------';

if [ ! -d "$backup_dir" ]; then # Create the directory for storing backups, if it doesn't exist already.
  mkdir $backup_dir;
  mkdir $backup_dir/older;
fi

mkdir $backup_dir/older/$last_backup_time # Create a Directory with the current timestamp so older backups are easier to find.

wp db export $backup_dir/latest-db-dump.sql; # Export the database as 'latest'. it the export is successfull, copy the sql file to it's respective timestamp directory.
if [ $? -eq 0 ]; then
    echo "***** Done!";
    db_export_status="OK";
    cp $backup_dir/latest-db-dump.sql $backup_dir/older/$last_backup_time/$backup_file_name;
else
    echo "***** FAIL!";
    db_export_status="FAIL";
fi

echo '--------';
echo 'Starting file backup';
echo '--------';

tar -vczf ~/opendata-cms-backup/latest-files-backup.tar.gz ./../..;
cp ~/opendata-cms-backup/latest-files-backup.tar.gz ~/opendata-cms-backup/older/$last_backup_time/$last_backup_time-files.tar.gz;

echo '--------';
echo 'Backup complete.';
echo 'You can find the archived files in ' $backup_dir;
