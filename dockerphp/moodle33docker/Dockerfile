FROM php:7.0-fpm

ENV PHP_IDE_CONFIG="serverName=moodledocker"

RUN apt-get update \
 && apt-get install -y zlib1g-dev \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
        sendmail \
        libxml2-dev \
        libicu-dev \
        libpq-dev
RUN rm -rf /var/lib/apt/lists/*do

RUN docker-php-ext-install zip
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install gd
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install xmlrpc
RUN docker-php-ext-install soap
RUN docker-php-ext-install intl
RUN docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
  && docker-php-ext-install pdo pdo_pgsql pgsql

RUN pecl config-set php_ini /usr/local/etc/php/config/php.ini
RUN docker-php-ext-enable opcache
RUN pecl install xdebug
RUN docker-php-ext-enable xdebug

COPY moodle /var/www/html

WORKDIR /var/www

RUN ["chmod", "-R", "777", "/var/www/html"]
RUN ["mkdir", "moodledata"]
RUN ["chmod", "-R", "777", "/var/www/moodledata"]

WORKDIR /var/www/html

EXPOSE 9000
