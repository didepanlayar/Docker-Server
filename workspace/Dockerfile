ARG DOCKER_PHP_VERSION
FROM php:${DOCKER_PHP_VERSION}-cli-alpine

# Install Dependencies, NodeJS and Composer
RUN apk update && \
    apk add --no-cache \
        tzdata \
        wget \
        nano \
        git \
        tree \
        nodejs \
        npm \
        yarn \
        mariadb-client && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer && \
    ln -s /usr/bin/composer /usr/local/bin/composer && \
    rm -rf /var/cache/apk/*

# PHP Extension
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN chmod +x /usr/local/bin/install-php-extensions && \
    install-php-extensions \
        gd \
        intl \
        mbstring \
        pcntl \
        pdo_mysql \
        redis \
        zip \
        && rm /usr/local/bin/install-php-extensions

WORKDIR /var/www