# Using this article as source: https://www.smashingmagazine.com/2015/09/wordpress-management-with-wp-cli/

# Main configuration.
# !!! Optional stuff will be marked as such, everything else is REQUIRED. !!!!!!
# The vars below are important, so please doublecheck them.

# Required vars
dbname = 'dbname'
dbuser = 'dbuser'
dbpass = 'dbpass'
site_url = 'http://example.com' # The url of your new site
admin_user = '' # You can set this to whatever you want, try not to use something too obvious like 'admin' or 'administrator'
admin_password = '' # At least 10 characters.
admin_email = ''

# Optional vars
dbhost = 'localhost' #Optional. This should remain 'localhost' in 99% of the cases. Only change it if you really know what you're doing.
dbprefix = 'odwp_' #Optional.
site_title = 'Another WordPress site' # WordPress site title. You can change this later in the WordPress settings.

# This script assumes that you have 'wp-cli' and 'npm' installed and properly set up.
# You also need a mysql database ready and you need to fill in the db name, user and password in the above variables.
# We also assume you cloned the 'opendata-cms' repository in your webroot(or wherever you want the wordpress instance installed)
# The structure we expect is '*webroot*/opendata-cms/wp-cli-deploy/install.sh'. WordPress will be installed in '*webroot*/'   ('./../../').

#download latest WordPress and place it in the webroot(or the same dir you cloned the repo in)
wp core download --path=./../../ --locale=bg_BG

#Create a config file, containing all the information WordPress needs to install.
wp core config --dbname=$dbname --dbuser=$dbuser --dbpass=$dbpass --dbhost=$dbhost --dbprefix=$dbprefix

#install WordPress
wp core install --url=$site_url  --title="$site_title" --admin_user=$admin_user --admin_password=$admin_password --admin_email=$admin_email

#Copy the wp-content directory from the repository.
cp -r ./../wp-content/* ./../../wp-content/

#activate required files

#clone repo

#generate crap for the theme

#activate theme
