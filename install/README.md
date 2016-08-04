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
* `unzip`, в случай че го няма на системата по подразбиране(Нужен при инсталирането на `opendata-wp` темата.)

## Инсталация

1. Клонирайте хранилището, копирайте конфигурационния скрипт и го редактирайте:

    ```shell
    git clone https://github.com/governmentbg/opendata-cms.git
    cd opendata-cms
    cp ./install/install.config.example ./install/install.config
    nano ./install/install.config
    ```

2. Стартирайте инсталационния скрипт, посочвайки пътя до папката, където искате да бъде инсталиран WordPress (директорията ще бъде създадена, ако не съществува). По възможност направете това като потребителя, с който ще работи WordPress, за да бъдат създадени директориите с правилните права (наприемр, `www-data`):

    ```shell
    ./install/install.sh /var/www/opendata-cms
    ```

При успешно приключване вече може да отворите сайта и да влезете в административната част, намираща се на адрес `$URL/wp-admin` с потребителя и паролата, въведени от вас в `install.config`.

## Конфигурация на сайта след начална инсталация

### WordPress настройки

- Статична начална страница - нова страница ('Начало') с шаблон `Front`.
- Формат на дата/час, така че да са еднакви с портала (дата: `F m, Y`, час: `G:i`) (от Настройки > Общи)
- Добавяне на джаджи в страничната лента на главната страница. Могат да бъдат махани и размествани по всяко време (от Външен вид > Джаджи)
- Pretty URLs – например, "Дата и име" - `/%year%/%monthnum%/%day%/%postname%/` (от Настройки > Постоянни връзки)

### Настройки на темата (opendata-wp)

- Адресът, към който води логото в хедъра (от Външен вид > Настройки > Настройки на челото). По подразбиране води към началната страница на WordPress.
- Заглавие, кратко описание и favicon (от Външен вид > Настройки > Идентичност на сайта)

### Настройки за сигурност

Ползваме основно безплатното разширение [iThemes Security](https://wordpress.org/plugins/better-wp-security/), което с времето се е показало като едно от водещите в насока обезопасяване на WordPress инсталации. Следват приложените настройки (описани са само настройките, които се променят от състоянието им по подразбиране):

#### Global Settings

- Send digest Email - активирани известия за открити атаки на базата на блокирани IP адреси при опити за разбиване на потребителски пароли или сканиране на сайта за определен софтуер на него.
- Hide security menu in admin bar - оптимизиране на административната лента с премахването на бутона за настройките на сигурност.

#### 404 Detection

- Просто се включва със стандартни настройки.

#### Local Brute force protection

- Minutes to Remember Bad Login (check period) - от 5 на 10min.
- Automatically ban "admin" user - checked (никой няма причина да ползва такъв user, с добри намерения)

#### Database backups

Включва се като допълнителна алтернатива на собственото бекъп решение на сайта (`backup-restore/*.sh`).

- Backup Method - Save locally only - няма нужда от известия при всеки бекъп.
- Backups to Retain - 5
- Enable scheduled backups - checked
- Backup Interval - 7 days

#### System Tweaks

- Protect System Files - спиране на директния достъп по http до файлове, които биха издали информация за сайта, която не е нужна на посетителите. Ако файловете readme.html, readme.txt, wp-config.php, install.php, wp-includes, и .htaccess продължат да са достъпни под някаква форма, ще бъде нужно да им се премахнат правата за четене през командния ред.
- Disable directory browsing - забрана за директен достъп до директории, в които липсва индексен файл (примерно `http://example.com/wp-content/uploads/2016/07/`)
- Filter Request Methods - забрана за обработване на trace, delete, или track заявки;
- Filter Suspicious Query Strings in the URL - блокиране на заявки, които наподобяват популярни експлоатации на уязвимости (примерно опити за откриване и експлоатиране на timthumb библиотеката);
- Disable PHP in Uploads - забрана за изпълнение на PHP файлове в папката с качваните от потребителите файлове;

#### WordPress Tweaks

- Remove the Windows Live Writer header. - checked (Освен ако някой не ползва windows live writer)
- Reduce comment spam - checked
- XML-RPC - Disable pingbacks
- Disable Extra User Archives - checked

## Проблеми и предложения

При проблем, моля, сигнализирайте [в секция "Issues"](https://github.com/governmentbg/opendata-cms/issues/new).
