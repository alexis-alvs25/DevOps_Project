-- Initialisation de la base de données MariaDB avec 2 utilisateurs et une base de données.

CREATE USER 'nextcloud_u'@'%' IDENTIFIED BY 'pwd';
CREATE USER 'wordpress_u'@'%' IDENTIFIED BY 'pwd';
CREATE DATABASE nextcloud;
CREATE DATABASE wordpress;
GRANT ALL PRIVILEGES ON nextcloud.* TO 'nextcloud_u'@'%';
GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress_u'@'%';
FLUSH PRIVILEGES;
