sleep 5 

if [ ! -f /var/www/html/wp-config.php ]
then
	echo "installing wordpress ..."
	cd /var/www/html
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp
	wp --allow-root --path=/var/www/html/ core download
	wp --allow-root --path=/var/www/html/ config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --dbhost=mariadb:3306
	wp --allow-root --path=/var/www/html/ core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_name=$ADMIN_NAME --admin_password=$ADMIN_PASS --admin_email=$WP_EMAIL
	wp --allow-root user create $DB_USER $USER_EMAIL --role=author --user_pass=$DB_PASS
	wp --allow-root theme install Blocksy --activate
	#wp --allow-root plugin install redis-object-cache --activate
	chown -R www-data:www-data /var/www/html 
else
	echo "wordpress is already in"
fi

php-fpm8.2 -F
