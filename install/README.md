# Open Data WordPress Install script

## Какво прави?

Текущият скрипт служи за инсталиране на нов WordPress сайт, използващ opendata-wp темата на произволно място

След успешно изпълнение на скрипта, се случва следното:

* Сваля се последната налична версия на WordPress с желания превод в посочената папка (обикновено това трябва да е web root директорията, например `/var/www/opendata-cms`).
* Използвайки данните, въведени в конфигурационния файл `install.config`, се генерира конфигурационния файл на WordPress `wp-config.php`.
* Инсталира се WordPress, използвайки данните, въведени в `install.config` и новосъздадения `wp-config.php`.
* Сваля се последната release версия на opendata-wp темата от [хранилището в GitHub](http://github.com/governmentbg/opendata-cms/) и се инсталира и активира.

## Изисквания за инсталацията

* Linux или Unix-like сървърна среда.
* Препоръчително PHP 5.6+ и MySQL или MariaDB 5.6+, или минимум PHP 5.2.4+ and MySQL 5.0+ (според [изискванията на WordPress](https://wordpress.org/about/requirements/)). PHP трябва да има поддръжка за MySQL.
* Конфигуриран и работещ PHP-FPM и Nginx или Apache уеб сървър и write достъп до webroot-а.
* Създадена MySQL база данни и потребител, имащ пълен достъп до нея.
* Инсталирано [WP-CLI](http://wp-cli.org/) в `$PATH` (като изпълним файл `wp`).
* Попълнен с правилната информация `install.config` файл. За целта се копира съдържанието на [`install.config.example`](install.config.example) в нов файл с име `install.config` в същата директория и се попълват променливите вътре с данните, нужни за новата инсталация.

## Инсталация

1. Клонирайте хранилището, копирайте конфигурационния скрипт и го редактирайте:

```shell
git clone https://github.com/governmentbg/opendata-cms.git
cd opendata-cms
cp opendata-cms/install/install.config.exmample opendata-cms/install/install.config
```

2. Стартирайте инсталационния скрипт, посочвайки пътя до папката, където искате да бъде инсталиран WordPress (директорията ще бъде създадена, ако не съществува). По възможност направете това като потребителя, с който ще работи WordPress, за да бъдат създадени директориите с правилните права (наприемр, `www-data`):

```shell
./opendata-cms/install/install.sh /var/www/opendata-cms
```

При успешно приключване вече може да отворите сайта и да влезете в административната част, намираща се на адрес `$URL/wp-admin` с потребителя и паролата, въведени от вас в `install.config`.

## Проблеми и предложения

При проблем, моля, сигнализирайте [в секция "Issues"](https://github.com/governmentbg/opendata-cms/issues/new).
