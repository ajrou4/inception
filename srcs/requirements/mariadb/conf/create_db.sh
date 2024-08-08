sed -i "s/127.0.0.1/0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf

mariadb-install-db --user=mysql --ldata=/var/lib/mysql

cat << EOF > /tmp/init.maria
FLUSH PRIVILEGES;

CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASS}';

CREATE DATABASE IF NOT EXISTS ${DB_NAME};

GRANT ALL PRIVILEGES ON *.* TO '${DB_USER}'@'%' WITH GRANT OPTION;

FLUSH PRIVILEGES;

ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT}';

EOF

mariadbd --bootstrap --user=root < /tmp/init.maria

mariadbd --user=root
