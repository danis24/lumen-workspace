FROM danis24/apache-php
MAINTAINER Danis Yogaswara <danis@aniqma.com>

RUN apt-get update && apt-get -y install git curl php-mcrypt php-json php-xml php-mbstring && apt-get -y autoremove && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN /usr/sbin/a2enmod rewrite

ADD 000-lumen.conf /etc/apache2/sites-available/
ADD 001-lumen-ssl.conf /etc/apache2/sites-available/
RUN /usr/sbin/a2dissite '*' && /usr/sbin/a2ensite 000-lumen 001-lumen-ssl

RUN /usr/bin/curl -sS https://getcomposer.org/installer |/usr/bin/php
RUN /bin/mv composer.phar /usr/local/bin/composer
RUN /usr/local/bin/composer update
RUN /usr/local/bin/composer create-project laravel/lumen /var/www/lumen --prefer-dist
RUN /bin/chown www-data:www-data -R /var/www/laravel/storage /var/www/lumen/bootstrap/cache

EXPOSE 80
EXPOSE 443

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
