ARG DOCKER_PHP_VERSION=8.2
FROM php:${DOCKER_PHP_VERSION}-cli

# Set environment untuk non-interactive installation
ENV DEBIAN_FRONTEND=noninteractive

# Install Dependencies, NodeJS and Composer
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        curl \
        tzdata \
        wget \
        nano \
        git \
        tree \
        curl \
        gnupg2 \
        ca-certificates \
        lsb-release \
        apt-transport-https \
        mariadb-client \
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
    # Install NodeJS
    curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - && \
    apt-get install -y nodejs && \
    # Install Yarn
    npm install -g yarn && \
    # Install Composer
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer && \
    ln -s /usr/bin/composer /usr/local/bin/composer && \
    rm -rf /var/lib/apt/lists/*

# PHP Extension Installer
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN chmod +x /usr/local/bin/install-php-extensions && \
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
        pcntl \
        pdo \
        pdo_mysql \
        redis \
        soap \
        sodium \
        sysvsem \
        sysvshm \
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

WORKDIR /var/www