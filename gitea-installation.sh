#!/bin/bash
#Aurthor: Muhammad Asim
#Purpose:Deploy Gitea in docker in few minutes.



#MARIADB SETUP

docker run --name mariadb -e MYSQL_ROOT_PASSWORD=test123 -e MYSQL_DATABASE=gitea -e MYSQL_USER=gitea -e MYSQL_PASSWORD=test123 -p 3306:3306 -v /root/MARIADB:/var/lib/mysql --restart unless-stopped -id mariadb:10

#PHPMYADMIN SETUP
docker run --name phpmyadmin --link mariadb:db -p 8080:80 --restart unless-stopped -id phpmyadmin/phpmyadmin


#Installtion of Gitea 
docker run --name gitea -v /root/GITEA:/data -p 80:3000 -p 2222:22 --link mariadb:db --restart unless-stopped -d gitea/gitea


#END
