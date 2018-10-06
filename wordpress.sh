#!/bin/bash
#Aurthor: Muhammad Asim
#Purpose:Deploy WORDPRESS in docker in few minutes.



#MYSQL SETUP

docker run --name MYSQL -e MYSQL_ROOT_PASSWORD=abc -p 3306:3306 -v /root/MYSQL:/var/lib/mysql -id mysql:5.7

#PHPMYADMIN SETUP
docker run --name PHPMYADMIN --link MYSQL:db -p 8080:80 -id phpmyadmin/phpmyadmin


#BUSYBOX FOR DATA ONLY CONTAINERS
#docker create -v /root/BUSYBOX:/var/www/html --name BUSYBOX busybox



#Installtion of WORDPRESS locally
docker run --name WORDPRESS -h skyhost.pk -v /root/skyhost.pk:/var/www/html -p 80:80 --link=MYSQL:db -d wordpress:latest


#END
