ARG DOCKER_PHP_VERSION
FROM php:${DOCKER_PHP_VERSION}-fpm-alpine

# Install Dependencies, NodeJS and Composer
RUN apk update && \
    apk add --no-cache \
        tzdata && \
    rm -rf /var/cache/apk/*

# PHP Extension
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN apk add --no-cache --virtual .build-deps $PHPIZE_DEPS && \
        pecl install uploadprogress && \
        docker-php-ext-enable uploadprogress && \
        apk del .build-deps $PHPIZE_DEPS && \
        chmod uga+x /usr/local/bin/install-php-extensions && sync && \
        install-php-extensions \
            ast \
            bcmath \
            bz2 \
            calendar \
            curl \
            exif \
            fileinfo \
            ftp \
            gd \
            gettext \
            imagick \
            imap \
            intl \
            ldap \
            mbstring \
            mcrypt \
            memcached \
            mongodb \
            mysqli \
            opcache \
            pdo \
            pdo_mysql \
            redis \
            soap \
            sodium \
            sysvsem \
            sysvshm \
            xmlrpc \
            xsl \
            zip

#
#--------------------------------------------------------------------------
# Final Touch
#--------------------------------------------------------------------------
#

COPY ./opcache.ini /usr/local/etc/php/conf.d/opcache.ini
COPY ./laravel.ini /usr/local/etc/php/conf.d
COPY ./xlaravel.pool.conf /usr/local/etc/php-fpm.d/

RUN apk add --no-cache \
        --repository http://dl-3.alpinelinux.org/alpine/edge/community/ --allow-untrusted --virtual \
        .shadow-deps \
        shadow && \
    usermod -u 1000 www-data && \
    groupmod -g 1000 www-data && \
    apk del .shadow-deps

WORKDIR /var/www

CMD ["php-fpm"]

EXPOSE 9000