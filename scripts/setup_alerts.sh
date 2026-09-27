#!/bin/bash

echo "Setting up Kapacitor alerts..."

docker exec kapacitor kapacitor define cpu_alert \
  -type stream \
  -tick /etc/kapacitor/tasks/cpu_alert.tick \
  -dbrp telegraf.autogen

docker exec kapacitor kapacitor enable cpu_alert

docker exec kapacitor kapacitor define memory_alert \
  -type stream \
  -tick /etc/kapacitor/tasks/memory_alert.tick \
  -dbrp telegraf.autogen

docker exec kapacitor kapacitor enable memory_alert

docker exec kapacitor kapacitor define cms_alert \
  -type stream \
  -tick /etc/kapacitor/tasks/cms_alert.tick \
  -dbrp telegraf.autogen

docker exec kapacitor kapacitor enable cms_alert

docker exec kapacitor kapacitor define mysql_alert \
  -type stream \
  -tick /etc/kapacitor/tasks/mysql_alert.tick \
  -dbrp telegraf.autogen

docker exec kapacitor kapacitor enable mysql_alert

echo "All alerts configured!"