#!/bin/bash

sed -i "s|address = .*|address = ${ZABBIX_SERVER}|" /etc/mamonsu/agent.conf

exec mamonsu -c /etc/mamonsu/agent.conf -p /var/run/mamonsu.pid