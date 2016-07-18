#!/bin/bash

config="./restore.config"
if [ -f "$config" ]
then
  . $config #if restore.config is present, use it as source(using '.' as source can cause trouble on some environments)
else
  echo "Sorry, I couldn't find an 'install.config' file. Copy install.config.example to install.config and fill in all the required information inside to continue."
  exit 0
fi

echo '--------';
echo 'Putting WordPress under maintainance mode';
echo '--------';

echo $maintainancemsg > ../.maintenance;

echo '--------';
echo 'Let us have a backup of the database before restoring (WP-CLI export)';
echo '--------';

wp db export ~/dbbackup-before-restore.sql;

wp db import ~/latest-db-dump.sql;

echo '--------';
echo 'Now extracting the files from the backup archive';
echo '--------';


