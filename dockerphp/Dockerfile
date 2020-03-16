FROM php:7.4.2-fpm

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
        libpq-dev \
        git \
        libzip-dev
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

# Get composer and verify its signature, update hash if you get corrupt installer message
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('SHA384', 'composer-setup.php') === 'e0012edf3e80b6978849f5eff0d4b4e4c79ff1609dd1e613307e16318854d24ae64f26d17af3ef0bf7cfb710ca74755a') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php --install-dir /usr/local/bin --filename=composer

COPY --chown=www-data:www-data moodlegit /var/www/html

WORKDIR /var/www

RUN mkdir /xdebugprofiles
RUN chown -R www-data /xdebugprofiles
RUN chmod -R 777 /xdebugprofiles

# Set permissions for server
RUN ["mkdir", "moodledata"]
RUN ["mkdir", "phpu_moodledata"]
RUN ["mkdir", ".composer"]
RUN ["chown", "-R", "www-data:www-data", "/var/www"]
RUN ["chmod", "-R", "777", "/var/www"]
USER www-data:www-data

WORKDIR /var/www/html

EXPOSE 9000
