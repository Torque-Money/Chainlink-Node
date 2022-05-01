#!/bin/bash

read -p "User: " USER
read -p "Host: " HOST

ssh $USER@$HOST -L 6688:localhost:6688 -N