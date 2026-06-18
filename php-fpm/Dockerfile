ARG PHP_VERSION
FROM php:${PHP_VERSION}-fpm-alpine

# Uses a modern and efficient approach to install extensions without unnecessary bloat.
COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/

RUN install-php-extensions \
    pdo_mysql \
    mysqli \
    bcmath \
    zip \
    gd \
    intl \
    exif \
    pcntl \
    redis \
    @composer

WORKDIR /var/www

CMD ["php-fpm"]
