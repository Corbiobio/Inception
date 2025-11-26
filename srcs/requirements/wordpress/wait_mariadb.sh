#!/bin/sh

echo aaaaaaaaaaaaaaaa

max=10
for i in `seq 1 $max`
do
	mysql --host=${DB_HOST} --user=${DB_USER} --password=${DB_PASS} -e "USE ${DB_NAME};"
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

if ! [ -f wp-config.php ]; then
    echo "Installing WordPress..."

    wp core download --allow-root

    wp config create --allow-root \
        --dbname=${DB_NAME} \
        --dbuser=${DB_USER} \
        --dbpass=${DB_PASS} \
        --dbhost=${DB_HOST}

   wp core install --allow-root \
        --url=https://edarnand.42.fr \
        --title=best_wordpress_site \
        --admin_user=${WP_ADMIN} \
        --admin_password=${WP_ADMIN_PASS} \
        --admin_email=fake@mail.com

   wp user create --allow-root \
	${WP_EDITOR} \
   	fake1@mail.com \
	--user_pass=${WP_EDITOR_PASS} \
	--role=editor
fi

exec /usr/sbin/php-fpm7.4 -F
