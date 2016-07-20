#!/bin/sh
config="./backup-restore.config";

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

if [ ! -d "$backup_dir" ]; then
  mkdir $backup_dir;
  mkdir $backup_dir/older;
fi

mkdir $backup_dir/older/$last_backup_time
wp db export ~/opendata-cms-backup/latest-db-dump.sql;
wp db export ~/opendata-cms-backup/older/$last_backup_time/$backup_file_name;

echo '--------';
echo 'Starting file backup';
echo '--------';

tar -vczf ~/opendata-cms-backup/latest-files-backup.tar.gz ./../..;
cp ~/opendata-cms-backup/latest-files-backup.tar.gz ~/opendata-cms-backup/older/$last_backup_time/$last_backup_time-files.tar.gz;

echo '--------';
echo 'Backup complete.';
echo 'You can find the archived files in ' $backup_dir;
