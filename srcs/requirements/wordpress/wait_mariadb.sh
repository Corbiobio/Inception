#!/bin/sh

max=10
for i in `seq 1 $max`
do
    mariadb-admin ping --host="mariadb" --user="db_user" --password="password" | grep alive
    if [ $? -eq 0 ]; then
        echo "mariadb up !"
        break
    fi
    if [ $i -eq $max ]; then
        echo "Cant connect to mariadb after 10 try"
        exit 1
    fi

    sleep 1
done

cd /var/www/wordpress

wp core download --allow-root
wp config create --allow-root --dbname=db_name --dbuser=db_user --dbpass=password --dbhost=mariadb
wp core install --allow-root --url=https://edarnand.42.fr --title=wordpress_of_the_year --admin_user=db_user --admin_password=password --admin_email=fake_mail@fake.com

exec /usr/sbin/php-fpm7.4 -F
