#!/bin/bash
# Multiple Directory Backup.

cd /var
file[0]=/var/www
file[1]=/var/lib/mongodb
file[2]=/var/lib/mysql
file[3]=/var/lib/sqlite
file[4]=/etc/php/7.2/apache2/custom/php.ini
file[5]=/etc/apache2/sites-available/default.conf
file[6]=/etc/nginx/sites-available/default.conf
file[7]=/etc/network/interfaces

tar -rvf backup_$(date '+%Y_%m_%d').tar ${file[@]}
