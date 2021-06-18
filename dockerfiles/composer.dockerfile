FROM composer:1.10.22

WORKDIR /var/www/html

ENTRYPOINT [ "composer", "--ignore-platform-reqs" ]