#!/bin/bash
mamonsu bootstrap \
    --host ${PG_SERVER} \
    --dbname=${MAMONSU_DB} \
    --username=${PG_USER} -M ${PG_USER}

mamonsu export template template.xml

mamonsu zabbix template export template.xml \
    --url=${ZABBIX_URL} \
    --user=${ZABBIX_USER} \
    --password=${ZABBIX_PASSWD}
