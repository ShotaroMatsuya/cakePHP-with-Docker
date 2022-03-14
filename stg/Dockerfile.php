FROM public.ecr.aws/r7o3o8n6/msqb-cms/base72
# dependencyのcopy
WORKDIR /var/www/html
COPY ./app/composer.json ./


# composerのインストール(1系)

COPY --from=public.ecr.aws/composer/composer:2 /usr/bin/composer /usr/bin/composer

RUN composer global require hirak/prestissimo --ignore-platform-reqs \
    && composer install --ignore-platform-reqs

# php.iniのコピー
COPY stg/php.ini /usr/local/etc/php/php.ini
# www.confのコピー(php-fpmパフォーマンスチューニング)
COPY stg/zzz-www.conf /usr/local/etc/php-fpm.d/zzz-www.conf

COPY app .
# php-fpmワーカー起動userはwww-data、copyするとrootになってしまうので変更
RUN chown -R www-data:www-data /var/www/html