#!/bin/bash
# ubuntu install dante
apt-get install dante-server
cp danted.conf /etc/
mkdir /var/log/sockd
/etc/init.d/danted start
