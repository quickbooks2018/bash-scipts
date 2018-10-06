#!/bin/bash

#MYSQL SETUP

docker run --name MYSQL -e MYSQL_ROOT_PASSWORD=abc -p 3306:3306 -v /root/MYSQL:/var/lib/mysql -id mysql:5.7

#PHPMYADMIN SETUP
docker run --name PHPMYADMIN --link MYSQL:db -p 8080:80 -id phpmyadmin/phpmyadmin

#BUSYBOX FOR DATA ONLY CONTAINERS

#docker create -v /root/BUSYBOX:/var/www/html --name BUSYBOX busybox

#Installtion of WHMCS locally
docker run --name WHMCS -p 80:80 --link=MYSQL:db -id chasim1982/whmcs:latest

#Main dir /var/www/html

#Make sure instead of giving localhost ===> give the ip address of MYSQL

#When you installed WHMCS you used the installation script at http://www.yourdomain.com/whmcs/install/install.php'>http://www.yourdomain.com/whmcs/install/install.php. #Delete, move, and/or rename the highlighted installation folder; the one that contains the install.php file... http://www.yourdomain.com/whmcs/install/install.php

#END
