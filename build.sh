#!/bin/bash
CONTAINER_UUID=`uuidgen`
docker build -rm -t newrelic-coreos-monitor .
docker run newrelic-coreos-monitor echo ${CONTAINER_UUID}
CONTAINER=`docker ps -a --no-trunc |grep ${CONTAINER_UUID}|awk '{print $1}'|head -n1`
docker export ${CONTAINER} | xz > newrelic-coreos-monitor-container.tar.xz

mkdir -p /opt/newrelic-coreos-monitor
tar -x -C /opt/newrelic-coreos-monitor -f newrelic-coreos-monitor-container.tar.xz
cp newrelic-coreos-monitor.service /etc/systemd/system/
