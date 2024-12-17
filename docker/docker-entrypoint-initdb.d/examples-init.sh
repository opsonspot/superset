#!/bin/bash
set -e

# Create user and database, and grant privileges
mysql -u "${MYSQL_USER}" -p"${MYSQL_PASSWORD}" <<-EOSQL
  CREATE USER '${EXAMPLES_USER}'@'%' IDENTIFIED BY '${EXAMPLES_PASSWORD}';
  CREATE DATABASE ${EXAMPLES_DB};
  GRANT ALL PRIVILEGES ON ${EXAMPLES_DB}.* TO '${EXAMPLES_USER}'@'%';
  FLUSH PRIVILEGES;
EOSQL

# Grant all privileges on the default schema (for MySQL it's typically the database itself)
mysql -u "${MYSQL_USER}" -p"${MYSQL_PASSWORD}" -D "${EXAMPLES_DB}" <<-EOSQL
  GRANT ALL PRIVILEGES ON ${EXAMPLES_DB}.* TO '${EXAMPLES_USER}'@'%';
  FLUSH PRIVILEGES;
EOSQL
