## WP-Cli Deploy

Скриптът е клониран от [тук](https://github.com/c10b10/wp-cli-deploy).

## Какво прави?

Скриптът се използва за инсталиране(deploy) на копие на тестов(staging) сайт върху жива(production) среда.

## Изисквания
За да сработи скрипта по очаквания начин, трябва да имате:

* Тестова среда с работещ сайт(който искате да копирате на живата.)
* Жива среда с инсталиран WordPress.
* Данни за достъп до базата данни и съответния mysql потребител на отдалечената среда(Ако изпълнявате скрипта на staging - живата среда.).
* WP-cli на средата, на която изпълнявате скрипта.
* wp-cli.yml файл с правилния път до скрипта(Обяснение малко по-надолу.)
* Нужните константи, записани във wp-config.php(Обяснение по-надолу.)

### wp-cli.yml
За да работят wp-cli командите ни както трябва, трябва да кажем на wp-cli къде се намива скрипта ни. За целта се създава файл ```wp-cli.yml```
в директорията, в която е инсталиран WordPress, а вътре се въвежда пътя до deploy.php файла:
```
require: "wp-cli-deploy/deploy.php"
```
Вече би трябвало да можете да използвате ```deploy``` командата. За да я тествате, опитайте да изпълните ```wp help deploy```.

### Същинска конфигурация:

WP-Cli-deploy се нужда е от малко информация, така че да може да достъпи отдалечената среда. Тази информация се въвежда като
константи във wp-config.php файла. Ето ги и всички константи, които wp-cli-deploy може да използва:
```
define( 'LIVE_URL', 'the-remote-website-url.com' );
define( 'LIVE_WP_PATH', '/path/to/the/wp/dir/on/the/server' );
define( 'LIVE_HOST', 'ssh_host' );
define( 'LIVE_USER', 'ssh_user' );
define( 'LIVE_PORT', '22' );
define( 'LIVE_PATH', '/path/to/a/writable/dir/on/the/server' );
define( 'LIVE_UPLOADS_PATH', '/path/to/the/remote/uploads/directory' );
define( 'LIVE_THEMES_PATH', '/path/to/the/remote/themes/directory' );
define( 'LIVE_PLUGINS_PATH', '/path/to/the/remote/plugins/directory' );
define( 'LIVE_DB_HOST', 'the_remote_db_host' );
define( 'LIVE_DB_NAME', 'the_remote_db_name' );
define( 'LIVE_DB_USER', 'the_remote_db_user' );
define( 'LIVE_DB_PASSWORD', 'the_remote_db_password' );
define( 'LIVE_POST_HOOK', 'echo "something to be executed when the command finishes"' );
```
=> ``` wp deploy push live [параметри]```

### Примери

```
# Качване на локалната база данни към живата среда
wp deploy push live --what=db

# Качване на локалните теми към живата среда
wp deploy push live --what=themes

# Качване на локалните разширения към живата среда
wp deploy push live --what=plugins

# Качване на локалните качени файлове(uploads директорията) към живата среда
wp deploy push live --what=uploads
```

Скрипта има и други възможности(напр. да работи в обратната посока), които са извън обхвата на текущата документация. За
повече информация относно всички възможности, четете [тук](https://github.com/c10b10/wp-cli-deploy/blob/master/README.md).
