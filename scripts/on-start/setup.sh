#!/bin/sh

echo "Starting setup.sh..."

echo "*       *       *       *       *       psql -U ${POSTGRES_USER} -d ${POSTGRES_DB} -f /usr/scripts/sql/whitelist.sql" >> /etc/crontabs/root
# echo "*       *       *       *       *       bash -c 'psql -U ${POSTGRES_USER} -d ${POSTGRES_DB} -f /usr/scripts/sql/whitelist.sql'" >> /etc/crontabs/root

crontab -l
crond