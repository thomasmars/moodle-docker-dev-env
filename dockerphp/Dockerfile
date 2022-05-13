FROM php:7.4-fpm

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
RUN docker-php-ext-install xmlrpc
RUN docker-php-ext-install soap
RUN docker-php-ext-install intl
RUN docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
  && docker-php-ext-install pdo pdo_pgsql pgsql

#RUN pecl config-set php_ini /usr/local/etc/php/config/php.ini
RUN docker-php-ext-enable opcache
RUN pecl install xdebug
RUN docker-php-ext-enable xdebug

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get -y install nodejs

# Get composer and verify its signature, update hash if you get corrupt installer message
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('sha384', 'composer-setup.php') === '55ce33d7678c5a611085589f1f3ddf8b3c52d662cd01d4ba75c0ee0459970c2200a51f492d557530c71c15d8dba01eae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php --install-dir /usr/local/bin --filename=composer

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
