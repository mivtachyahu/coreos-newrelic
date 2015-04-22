#!/bin/ash
: ${1:?"Usage: start.sh newrelic-licence-key"}
/usr/local/sbin/nrsysmond-config --set license_key=$1
/usr/local/sbin/nrsysmond -f -l /dev/stdout -c /etc/newrelic/nrsysmond.cfg
