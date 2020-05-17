FROM ubuntu:20.04

RUN apt update -y

RUN DEBIAN_FRONTEND=noninteractive apt install apache2 -y --no-install-recommends

RUN apt install nano php php-cli php-fpm php-json php-pdo php-mysql php-zip php-gd  php-mbstring php-curl php-xml php-pear php-bcmath -y

RUN apt install php-xdebug

RUN rm /var/www/html/index.html

RUN echo "\nzend_extension=xdebug.so\nxdebug.remote_autostart=1\nxdebug.remote_host=host.docker.internal\nxdebug.remote_enable=1\n" >> /etc/php/7.4/apache2/php.ini 

COPY index.php /var/www/html/index.php

CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
