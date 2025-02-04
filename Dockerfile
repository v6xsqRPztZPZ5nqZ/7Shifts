FROM php:8.0-cli
COPY . /usr/src/app
WORKDIR /usr/src/app
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN apt-get update && apt-get install -y \
    git \
    zlib1g-dev \
    libzip-dev \
    unzip
RUN docker-php-ext-install zip
RUN composer install
CMD [ "php", "./index.php" ]
