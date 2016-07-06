last_backup_time=$(date "+%Y-%m-%d-%H-%M-%S");
backup_file_name="db-backup_$last_backup_time.sql";

echo '--------';
echo 'Starting Database backup (WP-CLI export)';
echo '--------';

wp db export ~/$backup_file_name;

echo '--------';
echo 'Starting file backup';
echo '--------';

tar -vczf ~/files-backup_$last_backup_time.gz .;

echo '--------';
echo 'Backup complete';
