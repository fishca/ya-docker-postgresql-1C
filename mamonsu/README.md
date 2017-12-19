

Начальный запуск mamonsu.
Необходимо указать IP-адрес сервера, за которым будете наблюдать и имя базы данных, имя и пароль пользователя Postgres, используя которые mamonsu будет подключаться к серверу, адрес и учетные данные для доступа к web интерфейсу Zabbix сервера.

```
docker run --rm \
    -e ZABBIX_URL=http://192.168.99.100:8081/ \
    -e PG_SERVER=192.168.99.100 \
    -e PG_USER=postgres \
    -e MAMONSU_DB=mamonsu \
    silverbulleters/mamonsu init-start.sh
```

В результате mamonsu создаёт в указанной базе данных несколько таблиц с префиксом mamonsu. Не удаляйте эти таблицы, так как они нужны для работы mamonsu. А также производит экспорт шаблона мониторинга на сервер Zabbix.


WIP Создание группы и хоста
TODO - получение id элементов или задание их принудительно

docker run -it --entrypoint "mamonsu" silverbulleters/mamonsu zabbix hostgroup create pg --url=http://192.168.99.100:8081/ --user=Admin --password=zabbix


docker run -it --entrypoint "mamonsu" silverbulleters/mamonsu zabbix host create pg-master 15 10254 192.168.99.100 --url=http://192.168.99.100:8081/ --user=Admin --password=zabbix

где
    15 - id группы хостов созданной на предыдущем шаге
    10254 - id загруженного шаблона





