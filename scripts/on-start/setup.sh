#!/bin/sh

echo "Starting setup.sh..."

echo "*       *       *       *       *       bash -c 'touch /usr/scripts/sh/WORKED.txt'" >> /etc/crontabs/root

# psql -U ${POSTGRES_USER} -d ${POSTGRES_DB} -f /usr/scripts/sql/whitelist.sql

crontab -l
crond