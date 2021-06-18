FROM php:7.3-fpm

WORKDIR /var/www/html

# RUN apt-get -y update \
#     && apt-get install -y libicu-dev \ 
#     && docker-php-ext-configure intl \
#     && docker-php-ext-install pdo pdo_mysql intl

RUN apt-get update \
    && apt-get install -y vim less \
    && set -ex apk --no-cache add postgresql-dev libpq-dev \
    && apt-get install -y libpq-dev libicu-dev \
    && docker-php-ext-configure intl \
    && docker-php-ext-install pdo pdo_pgsql pgsql mbstring intl

COPY src .


RUN chown -R www-data:www-data /var/www/html