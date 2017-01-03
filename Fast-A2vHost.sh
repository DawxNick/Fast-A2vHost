#!/bin/bash
echo "Welcome to Fast-A2vHost."
echo "Enter your domain name (non-www)."
read DOMAIN
echo "Enter your domain name (www)."
read WWWDOMAIN
echo "Enter your webmaster's email address."
read EMAIL
echo "Enter your site directory. (/var/www/example.com)."
read DOCUMENTROOT
echo "<VirtualHost *:80>
	ServerAdmin $EMAIL
	ServerName $DOMAIN
	ServerAlias www.$DOMAIN
	DocumentRoot $DOCUMENTROOT
	ErrorLog \${APACHE_LOG_DIR}/error.log
	CustomLog \${APACHE_LOG_DIR}/access.log combined
</VirtualHost>" > /etc/apache2/sites-available/$DOMAIN.conf
echo "$DOMAIN vHost now created."
read -p "Press enter to finish."
service apache2 restart
