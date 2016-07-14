#!/bin/bash
# Using this article as source: https://www.smashingmagazine.com/2015/09/wordpress-management-with-wp-cli/

# Main configuration.
# !!! Optional stuff will be marked as such, everything else is REQUIRED. !!!!!!
# The vars below are important, so please doublecheck them.

# Required vars
od_dbname=''
od_dbuser=''
od_dbpass=''
od_site_url='' # The url of your new site
od_admin_user='' # You can set this to whatever you want, try not to use something too obvious like 'admin' or 'administrator'
od_admin_password='' # At least 10 characters.
od_admin_email=''

# Optional vars
od_dbhost='localhost' #Optional. This should remain 'localhost' in 99% of the cases. Only change it if you really know what you're doing.
od_dbprefix='odwp_' #Optional.
od_site_title='Another WordPress site, ja' # WordPress site title. You can change this later in the WordPress settings.

# This script assumes that you have 'wp-cli' and 'npm' installed and properly set up.
# You also need a mysql database ready and you need to fill in the db name, user and password in the above variables.
# We also assume you cloned the 'opendata-cms' repository in your webroot(or wherever you want the wordpress instance installed)
# The structure we expect is '*webroot*/opendata-cms/wp-cli-deploy/install.sh'. WordPress will be installed in '*webroot*/'   ('./../../').

#download latest WordPress and place it in the webroot(or the same dir you cloned the repo in)
wp core download --path=../../ --locale=bg_BG

#Create a config file, containing all the information WordPress needs to install.
wp core config --dbname=$od_dbname --dbuser=$od_dbuser --dbpass=$od_dbpass --dbhost=$od_dbhost --dbprefix=$od_dbprefix

#install WordPress
wp core install --url=$od_site_url  --title="$od_site_title" --admin_user=$od_admin_user --admin_password=$od_admin_password --admin_email=$od_admin_email

#Copy the wp-content from the repo to the new WordPress install
cp -r ../wp-content/* ../../wp-content/

#Download the theme package from the latest release, install it and then activate it(and update the old one if there already is one).
wp theme install $(curl -s https://api.github.com/repos/governmentbg/opendata-cms/releases | grep browser_download_url | head -n 1 | cut -d '"' -f 4) --force --activate
