#!/bin/sh

# **** Postgres is not even calling this file - fun fun fun!

echo "Starting setup.sh..."
echo "*       *       *       *       *       run-parts /etc/periodic/1min" >> /etc/crontabs/root

crontab -l
crond -f -l 8