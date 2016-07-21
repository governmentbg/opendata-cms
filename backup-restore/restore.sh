#!/bin/sh

config="./backup-restore.config";

if [ -f "$config" ]
then
  . $config; #if restore.config is present, use it as source
else
  echo "Sorry, I couldn't find a 'backup-restore.config' file. Copy backup-restore.config.example to backup-restore.config and fill in all the required information inside to continue.";
  exit 0;
fi

echo '--------';
echo 'Enabling maintenance mode';
echo '--------';

#You can change the message the site outputs during maintenance mode in the config file.
echo $maintenance_msg > ../../.maintenance;
if [ $? -eq 0 ]; then
    echo "***** Done! Maintenance mode enabled.";
    maintenance_mode_enable_status="OK";
else
    echo "***** FAIL! Couldn't enable maintenance mode.";
    maintenance_mode_enable_status="FAIL";
fi

echo '--------';
echo 'Backup the current database, just in case. A backup of the backup if you will. You can find it in ' $backup_dir;
echo '--------';

wp db export $backup_dir/dbbackup-before-restore.sql;

echo '--------';
echo 'Restoring the database...';
echo '--------';

wp db import $backup_dir/latest-db-dump.sql;
if [ $? -eq 0 ]; then
    echo "***** Done! The database was successfully imported.";
    db_import_status="OK";
else
    echo "***** FAIL! Couldn't import the database.";
    db_import_status="FAIL";
fi

echo '--------';
echo 'Now extracting the files from the backup archive';
echo '--------';

tar -zxvf $backup_dir/latest-files-backup.tar.gz -C ./../../;
if [ $? -eq 0 ]; then
    echo "***** Done! The site files were successfully extracted from the backup archive.";
    files_extract_status="OK";
else
    echo "***** FAIL! Could not extract site files from the backup archive.";
    files_extract_status="FAIL";
fi

echo '--------';
echo 'Disabling maintenance mode';
echo '--------';
rm ../../.maintenance;
if [ $? -eq 0 ]; then
    echo "***** Done! Maintenance mode disabled.";
    maintenance_mode_disable_status="OK";
else
    echo "***** FAIL! Coudn't disable maintenance mode. Check for a '.maintenance' file in your WordPress install directory, and delete it if there is one.";
    maintenance_mode_disable_status="FAIL";
fi

echo '----------------';
echo 'All done! Status log below:';
echo '-----';
echo 'Maintenance mode enabled: ' $maintenance_mode_enable_status;
echo '-----';
echo 'Database import: ' $db_import_status;
echo '-----';
echo 'Files import: ' $files_extract_status;
echo '-----';
echo 'Maintenance mode disabled: ' $maintenance_mode_disable_status;
echo 'Done.'
