


Выполните начальный запуск mamonsu. Вы должны указать IP-адрес сервера, за которым будете наблюдать, а также имя базы данных, имя и пароль пользователя Postgres Pro Enterprise, используя которые mamonsu будет подключаться к серверу. Если пароль не требуется, параметр -W можно опустить.


```
docker run --rm mamonsu bootstrap --host 192.168.99.100 --dbname mamonsu --username postgres
```

В результате mamonsu создаёт в указанной базе данных несколько таблиц с префиксом mamonsu. Не удаляйте эти таблицы, так как они нужны для работы mamonsu.


TODO экспорт шаблона
```
 "data": "Invalid parameter \"/rules/applications\": unexpected parameter \"updateExisting\"."
```

Создание группы и хоста

docker run -it --entrypoint mamonsu zabbix host create pg-master pg PostgresPro-Linux 192.168.99.100 --url=http://192.168.99.100:8081/ --user=Admin --password=zabbix mamonsu

TODO

