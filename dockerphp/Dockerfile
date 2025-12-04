FROM php:8.3-fpm

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
        libzip-dev \
        locales
RUN rm -rf /var/lib/apt/lists/*

RUN locale-gen en_AU.UTF-8
#RUN localedef -v -c -i en_AU -f UTF-8 en_AU.UTF-8
RUN docker-php-ext-install zip
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install gd
RUN docker-php-ext-install mysqli
RUN pecl install channel://pecl.php.net/xmlrpc-1.0.0RC3 xmlrpc
RUN docker-php-ext-enable xmlrpc
RUN docker-php-ext-install soap
RUN docker-php-ext-install intl
RUN docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
  && docker-php-ext-install pdo pdo_pgsql pgsql

#RUN pecl config-set php_ini /usr/local/etc/php/config/php.ini
RUN docker-php-ext-enable opcache
RUN pecl install xdebug
RUN docker-php-ext-enable xdebug

# Install Node
COPY --from=node:24-bookworm-slim /usr/local/bin/node /usr/local/bin/node
COPY --from=node:24-bookworm-slim /usr/local/lib/node_modules /usr/local/lib/node_modules

# Wire up npm / npx
RUN ln -s /usr/local/lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npm \
 && ln -s /usr/local/lib/node_modules/npm/bin/npx-cli.js /usr/local/bin/npx

# Get composer and verify its signature, update hash if you get corrupt installer message
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

# Set permissions for server
RUN ["chown", "-R", "www-data:www-data", "/var/www"]
RUN ["chmod", "-R", "777", "/var/www"]

COPY --chown=www-data:www-data moodlegit /var/www/html

WORKDIR /var/www

RUN mkdir /xdebugprofiles
RUN chown -R www-data /xdebugprofiles
RUN chmod -R 777 /xdebugprofiles

USER www-data:www-data
RUN ["mkdir", "moodledata"]
RUN ["mkdir", "phpu_moodledata"]
RUN ["mkdir", ".composer"]

WORKDIR /var/www/html

EXPOSE 9000
