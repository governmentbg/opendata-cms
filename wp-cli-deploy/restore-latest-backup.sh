#backup current db

echo '--------';
echo 'Let us have a backup of the database before restoring (WP-CLI export)';
echo '--------';

wp db export ~/dbbackup-before-restore.sql;

wp db import ~/latest-db-dump.sql;
