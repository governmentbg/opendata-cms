# Using this article as source: https://www.smashingmagazine.com/2015/09/wordpress-management-with-wp-cli/

#configuration:

opendata_dbname = 'dbname'
opendata_dbuser = 'dbuser'
opendata_dbpass = 'dbpass'


#download latest WordPress
wp core download --locale=bg_BG

#set wp-config data
wp core config --dbname=databasename --dbuser=databaseuser --dbpass=databasepassword --dbhost=localhost --dbprefix=prfx_

#install WordPress
wp core install --url=example.com  --title="WordPress Website Title" --admin_user=admin_user --admin_password=admin_password --admin_email="admin@example.com"

#install required files

#activate required files

#clone repo

#generate crap for the theme

#activate theme

