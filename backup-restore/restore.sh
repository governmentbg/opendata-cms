#!/bin/sh

config="./backup-restore.config";

backup_dir=~/opendata-cms-backup;
maintenance_msg="The site is under scheduled maintenance. Check back soon.";


if [ -f "$config" ]
then
  . $config; #if restore.config is present, use it as source
else
  echo "Sorry, I couldn't find a 'backup-restore.config' file. Copy backup-restore.config.example to backup-restore.config and fill in all the required information inside to continue.";
  exit 0;
fi

echo '--------';
echo 'Putting WordPress under maintainance mode';
echo '--------';

#You can change the message the site outputs during maintenance mode in the config file.
echo $maintenance_msg > ../../.maintenance;

echo '--------';
echo 'Backup the current database, just in case. A backup of the backup if you will. You can find it in ' $backup_dir;
echo '--------';

wp db export $backup_dir/dbbackup-before-restore.sql;

echo '--------';
echo 'Restoring the database...';
echo '--------';

wp db import $backup_dir/latest-db-dump.sql;

echo '--------';
echo 'Now extracting the files from the backup archive';
echo '--------';

tar -zxvf $backup_dir/latest-files-backup.tar.gz -C ./../../;

echo '--------';
echo 'Disable maintenance mode';
echo '--------';
rm ../../.maintenance;
