FROM php:7.4.15-apache

LABEL maintainer="Byeonghoon Choi <jklsj1252@gmail.com>"

# Install APT Package
RUN apt-get update
RUN apt-get install -y vim tar zip unzip net-tools iputils-ping

# Install PHP Modules
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install pdo_mysql

# Enalbe PHP Modules
RUN docker-php-ext-enable mysqli
RUN docker-php-ext-enable pdo_mysql

# Enable Apache modules
RUN a2enmod ssl
RUN a2enmod rewrite

# Install PHP Composer
WORKDIR "/bin"
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
