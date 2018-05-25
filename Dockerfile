FROM amazonlinux:2017.12

RUN amazon-linux-extras install php7.2

RUN yum update -y \
    && yum groupinstall "Development tools" -y \
    && yum install -y which libmemcached-devel zlib-devel \
    && yum install -y php php-cli php-devel php-pdo php-mbstring php-pear \
    && yum clean all && rm -rf /var/cache/yum

RUN pecl install memcached-3.0.4 \
    && echo "extension=/usr/lib64/php/modules/memcached.so" > /etc/php.d/memcached.ini \
    && pecl install zip-1.13.5 \
    && echo "extension=/usr/lib64/php/modules/zip.so" > /etc/php.d/zip.ini

# Symfony uses "composer.phar" as composer binary name.
# https://getcomposer.org/download/
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
    && php -r "unlink('composer-setup.php');" \
    && ln -s /usr/local/bin/composer /usr/local/bin/composer.phar


RUN mkdir /shared

WORKDIR /shared