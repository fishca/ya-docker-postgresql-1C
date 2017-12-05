#!/bin/bash
mamonsu export template template.xml
mamonsu zabbix template export template.xml \
    --url=http://192.168.99.100:8081/ \
    --user=Admin \
    --password=zabbix