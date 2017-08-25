#!/bin/sh

set -x

# Restart apache
service apache2 start

# Start ZoneMinder
/usr/bin/zmpkg.pl start

while :
do
    sleep 3600
done
