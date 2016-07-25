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
    cp ./install/install.config.example ./install/install.config
    ```

2. Стартирайте инсталационния скрипт, посочвайки пътя до папката, където искате да бъде инсталиран WordPress (директорията ще бъде създадена, ако не съществува). По възможност направете това като потребителя, с който ще работи WordPress, за да бъдат създадени директориите с правилните права (наприемр, `www-data`):

    ```shell
    ./install/install.sh /var/www/opendata-cms
    ```

При успешно приключване вече може да отворите сайта и да влезете в административната част, намираща се на адрес `$URL/wp-admin` с потребителя и паролата, въведени от вас в `install.config`.

##Конфигурация на сайта, след начална инсталация:

WordPress настройки:
- [x] Статична начална страница - нова страница('Начало') с шаблон 'Front'.
- [x] Формат на дата/час, така че да са еднакви с портала (дата: `F m, Y`, час: `G:i`)
- [x] Добавяне на джаджи в страничната лента на главната страница - по преценка какво искаме да има там от наличните (Добавени 'търсене', 'страници' и 'последни публикации'. Могат да бъдат махани и размествани по всяко време - админ панел > външен вид > джаджи).
- [x] Pretty URLs (например, "Дата и име" - `/%year%/%monthnum%/%day%/%postname%/`)

Настройки на темата(opendata-wp):
- [x] Адресът, към който води логото в хедъра
- [x] Мобилното меню - Offcanvas, вместо topbar.

Настройки за сигурност. Ползваме основно безплатното разширение [iThemes Security](https://wordpress.org/plugins/better-wp-security/), което с времето се е показало като едно от водещите в насока обезопасяване на WordPress инсталации. Следват приложените настройки:
__Тук описвам само настройките, които се променят от състоянието им по подразбиране.__
>Global Settings:

- [x] Send digest Email - активирани известия за открити атаки на базата на блокирани IP адреси при опити за разбиване на потребителски пароли или сканиране на сайта за определен софтуер на него.
- [x] Hide security menu in admin bar - оптимизиране на административната лента с премахването на бутона за настройките на сигурност.

> 404 Detection:

- [x] Просто се включва със стандартни настройки.

> Local Brute force protection:

- [x] Minutes to Remember Bad Login (check period) - от 5 на 10min. 
- [x] Automatically ban "admin" user - checked (никой няма причина да ползва такъв user, с добри намерения)

> Database backups:
__Пускам го, въпреки че имаме наше си бекъп решение - повече бекъпи не вредят, винаги може да се забрави ръчен. ___

- [x] Backup Method - Save locally only - няма нужда да се спами при всеки бекъп.
- [x] Backups to Retain - 5
- [x] Enable scheduled backups - checked
- [x] Backup Interval - 7 days

> System Tweaks

- [x] Protect System Files - спиране на директния достъп по http до файлове, които биха издали информация за сайта, която не е нужна на посетителите. Ако файловете readme.html, readme.txt, wp-config.php, install.php, wp-includes, и .htaccess продължат да са достъпни под някаква форма, ще бъде нужно да им се премахнат правата за четене през командния ред.
- [x] Disable directory browsing - забрана за директен достъп до директории, в които липсва индексен файл (примерно http://example.com/wp-content/uploads/2016/07/)
- [x]  Filter Request Methods - забрана за обработване на trace, delete, или track заявки;
- [x] Filter Suspicious Query Strings in the URL - блокиране на заявки, които наподобяват популярни експлоатации на уязвимости (примерно опити за откриване и експлоатиране на timthumb библиотеката);
- [x] Disable PHP in Uploads - забрана за изпълнение на PHP файлове в папката с качваните от потребителите файлове;

> WordPress Tweaks

- [x] Remove the Windows Live Writer header. - checked (Освен ако някой не ползва windows live writer)
- [x] Reduce comment spam - checked
- [x] XML-RPC - Disable pingbacks
- [x] Disable Extra User Archives - checked

## Проблеми и предложения

При проблем, моля, сигнализирайте [в секция "Issues"](https://github.com/governmentbg/opendata-cms/issues/new).
