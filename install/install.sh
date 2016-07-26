#!/bin/sh

set -e

install_root_dir=`dirname "$0"`
config="$install_root_dir/install.config"
webroot_path="$1"

if [ -z "$webroot_path" ]
then
  echo "Usage: $0 /webroot/path/to/install/to"
  exit 1
fi

if [ -f "$config" ]
then
  . $config
else
  echo "Sorry, I couldn't find an 'install.config' file. Copy $install_root_dir/install.config.example to $config and fill in all the required information inside to continue."
  exit 2
fi

missing_variables=""
for required_variable in od_admin_user od_admin_password od_admin_email od_dbname od_dbuser
do
  eval "value=\$$required_variable"
  if [ -z "$value" ]
  then
    missing_variables="$missing_variables\nPlease fill in the $required_variable variable"
  fi
done

if [ ! -z "$missing_variables" ]
then
  echo "You have not provided values to some of the required variables in $config:"
  echo $missing_variables
  exit 3
fi

if ! which wp >/dev/null
then
  echo "Cannot find a 'wp' binary in PATH. Please make sure wp-cli is installed properly (see http://wp-cli.org/)."
  exit 4
fi

# This script assumes that you have 'wp-cli' installed and properly set up.
# You also need a mysql database ready and you need to fill in the db name, user and password in the above variables.

echo "Downloading the latest WordPress and placing it in '$webroot_path'..."
if [ -d "$webroot_path" -a -f "$webroot_path/wp-settings.php" ]
then
  echo "WordPress seems to be already downloaded and present in '$webroot_path'"
else
  wp core download --path="$webroot_path" --locale="$od_locale"
fi

echo "Creating a config file, containing all the information WordPress needs to install..."
if [ -f "$webroot_path/wp-config.php" ]
then
  echo "A wp-config.php file already exists in '$webroot_path'."
else
  wp core config --path="$webroot_path" --dbname="$od_dbname" --dbuser="$od_dbuser" --dbpass="$od_dbpass" --dbhost="$od_dbhost" --dbprefix="$od_dbprefix"
fi

echo "Installing WordPress..."
wp core install --path="$webroot_path" --url="$od_site_url"  --title="$od_site_title" --admin_user="$od_admin_user" --admin_password="$od_admin_password" --admin_email="$od_admin_email"

echo "Downloading, installing and activating the latest opendata-cms theme (this will update the theme if it's already installed)..."
      # wp theme install --path="$webroot_path" $(curl -s "$od_theme_releases_url" | grep browser_download_url | head -n 1 | cut -d '"' -f 4) --activate
wget $(curl -s "$od_theme_releases_url" | grep browser_download_url | head -n 1 | cut -d '"' -f 4) -P $webroot_path/wp-content/themes/
#store the download status in a variable for later use
if [ $? -eq 0 ]
then

  # Create the theme directory if it doesn't exist.
  if [ ! -d "$webroot_path/wp-content/themes/opendata-wp" ]
  then
    mkdir $webroot_path/wp-content/themes/opendata-wp
  fi

  # Extract the theme from the zip.
  unzip $webroot_path/wp-content/themes/foundationpress_*.zip -d $webroot_path/wp-content/themes/opendata-wp
  wp --path="$webroot_path" theme activate opendata-wp --force
  # We don't need the theme archive anymore.
  rm $webroot_path/wp-content/themes/foundationpress_*.zip
else
  echo "Theme download failed. Is the download URL correct?"
fi

echo
echo "All done, WordPress installed and configured. Happy publishing!"
echo
