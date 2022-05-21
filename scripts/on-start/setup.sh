#!/bin/sh

echo "Starting setup.sh..."
echo "*       *       *       *       *       echo hello" >> /etc/crontabs/root

crontab -l