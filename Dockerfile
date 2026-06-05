FROM php:8.2-fpm

WORKDIR /var/www/html

RUN apt-get update && apt-get upgrade 
RUN apt-get install libzip-dev lib zip unzip mariadb-client

RUN docker-php-ext-install pdo pdo_mysql zip

COPY --from=composer /usr/bin/composer /usr/bin/composer

COPY . .

CMD ["php-fpm"]