- The `opendata-cms.conf` file should go in the `/etc/nginx/sites-available/` directory. If you want the server to actually use the file, create a symlink to it in the `/etc/nginx/sites-enabled`, just like the `default` configuration.

- The `_fastcgi_init.conf` should be in `/etc/nginx/`. It contains all the fastCGI directives, so you'll probably want to check it out and make sure it's looking for the same php version you have installed.

- The `_site_admin_whitelist_ips.conf` is a list of IPs that will be allowed access to the admin area of the site. Everyone else will see a 403. It's commented out by default, so everyone can access the login page.
