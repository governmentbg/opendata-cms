last_backup_time=$(date "+%Y-%m-%d-%H-%M-%S");
backup_file_name="$last_backup_time-DB.sql";
backup_dir=~/opendata-cms-backup

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

tar -vczf ~/opendata-cms-backup/files-backup_latest.gz .;
cp ~/opendata-cms-backup/files-backup_latest.gz ~/opendata-cms-backup/older/$last_backup_time/$last_backup_time-files.gz

echo '--------';
echo 'Backup complete.';
echo 'You can find the archived files in ' $backup_dir;
