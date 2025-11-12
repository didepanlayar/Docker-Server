ARG DOCKER_PHP_VERSION=8.2
FROM php:${DOCKER_PHP_VERSION}-fpm

# Set environment untuk non-interactive installation
ENV DEBIAN_FRONTEND=noninteractive

# Install Dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        curl \
        tzdata \
        libz-dev \
        libpq-dev \
        libzip-dev \
        libpng-dev \
        libjpeg-dev \
        libfreetype6-dev \
        libwebp-dev \
        libxpm-dev \
        libmcrypt-dev \
        libonig-dev \
        libxml2-dev \
        libbz2-dev \
        libcurl4-openssl-dev \
        libxslt1-dev \
        libldap2-dev \
        libkrb5-dev \
        libmagickwand-dev \
        libmemcached-dev \
        libssl-dev \
        zlib1g-dev \
        libicu-dev \
        g++ \
        wget \
        unzip && \
    rm -rf /var/lib/apt/lists/*

# PHP Extension Installer
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN chmod uga+x /usr/local/bin/install-php-extensions && sync && \
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
        uploadprogress \
        xmlrpc \
        xsl \
        zip && \
    # Install mcrypt (only for PHP 7.x, deprecated in PHP 8.x)
    if [ "${DOCKER_PHP_VERSION%%.*}" = "7" ]; then \
        install-php-extensions mcrypt; \
    fi && \
    # Install memcached with the appropriate version
    if [ "${DOCKER_PHP_VERSION%%.*}" = "7" ]; then \
        install-php-extensions memcached-3.2.0; \
    else \
        install-php-extensions memcached; \
    fi

#
#--------------------------------------------------------------------------
# Final Touch
#--------------------------------------------------------------------------
#

COPY ./opcache.ini /usr/local/etc/php/conf.d/opcache.ini
COPY ./laravel.ini /usr/local/etc/php/conf.d
COPY ./xlaravel.pool.conf /usr/local/etc/php-fpm.d/

# Change UID and GID of www-data to 1000
RUN usermod -u 1000 www-data && \
    groupmod -g 1000 www-data

WORKDIR /var/www

CMD ["php-fpm"]

EXPOSE 9000