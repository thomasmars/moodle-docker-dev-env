FROM php:7.1-fpm

ENV PHP_IDE_CONFIG="serverName=moodledocker"

RUN apt-get update \
 && apt-get install -y zlib1g-dev \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
        sendmail \
        libxml2-dev \
        libicu-dev \
        libpq-dev
RUN rm -rf /var/lib/apt/lists/*

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

# Get composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('SHA384', 'composer-setup.php') === '93b54496392c062774670ac18b134c3b3a95e5a5e5c8f1a9f115f203b75bf9a129d5daa8ba6a13e2cc8a1da0806388a8') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"

COPY moodlegit /var/www/html

WORKDIR /var/www

RUN mkdir /xdebugprofiles
RUN chown -R www-data /xdebugprofiles
RUN chmod -R 777 /xdebugprofiles

# Set permissions for server
RUN ["chown", "-R", "www-data", "/var/www/html"]
RUN ["chmod", "-R", "777", "/var/www/html"]
RUN ["mkdir", "moodledata"]
RUN ["chown", "-R", "www-data", "/var/www/moodledata"]
RUN ["chmod", "-R", "777", "/var/www/moodledata"]
USER www-data:www-data

WORKDIR /var/www/html

EXPOSE 9000
