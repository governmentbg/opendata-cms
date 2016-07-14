#!/bin/bash

config="./install.config"
if [ -f "$config" ]
then
  . $config #if install.config is present, use it as source(using '.' as source can cause trouble on some environments)
else
  echo "Sorry, I couldn't find an 'install.config' file. Copy install.config.example to install.config and fill in all the required information inside to continue."
  exit 0
fi

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
