apt update
apt -y upgrade
apt -y install mysql-server
apt -y install unzip
sed -i 's/127.0.0.1/0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf

# Disable binary logging
echo "disable_log_bin" >> /etc/mysql/mysql.conf.d/mysqld.cnf

# sudo systemctl start mysql.service
/etc/init.d/mysql start
mysql -u root -e "CREATE DATABASE IF NOT EXISTS master;"
mysql -u root -e "CREATE DATABASE IF NOT EXISTS portal;"
mysql -u root -e "CREATE USER IF NOT EXISTS 'woodfrog'@'%' IDENTIFIED BY 'preciseV5';"
mysql -u root -e "GRANT ALL PRIVILEGES ON master.* TO 'woodfrog'@'%';"
mysql -u root -e "GRANT ALL PRIVILEGES ON portal.* TO 'woodfrog'@'%';"
mysql -u root -e "ALTER USER 'woodfrog'@'%' IDENTIFIED WITH 'caching_sha2_password' BY 'preciseV5';"
mysql -u root -e "update user set authentication_string=password('preciseRootV5') where user='root'; "
mysql -u root -e "FLUSH PRIVILEGES;"
