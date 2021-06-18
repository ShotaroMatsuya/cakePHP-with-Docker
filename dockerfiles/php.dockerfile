FROM php:7.3-fpm

WORKDIR /var/www/html

RUN apt-get -y update \
    && apt-get install -y libicu-dev \ 
    && docker-php-ext-configure intl \
    && docker-php-ext-install pdo pdo_mysql intl

COPY src .


RUN chown -R www-data:www-data /var/www/html