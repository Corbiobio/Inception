FROM debian:11

RUN apt update && apt install -y curl php-mysqli php-common libapache2-mod-php php-cli php-fpm mariadb-client

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar &&\
    mv wp-cli.phar /usr/local/bin/wp &&\
    mkdir -p /run/php /var/www/wordpress

COPY wait_mariadb.sh /var/www/wordpress/wait_mariadb.sh
RUN chmod +700 /var/www/wordpress/wait_mariadb.sh

ENTRYPOINT ["/bin/sh", "/var/www/wordpress/wait_mariadb.sh"]

