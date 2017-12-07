


Выполните начальный запуск mamonsu. Вы должны указать IP-адрес сервера, за которым будете наблюдать, а также имя базы данных, имя и пароль пользователя Postgres Pro Enterprise, используя которые mamonsu будет подключаться к серверу. Если пароль не требуется, параметр -W можно опустить.


```
docker run --rm mamonsu bootstrap --host 192.168.99.100 --dbname mamonsu --username postgres
```

В результате mamonsu создаёт в указанной базе данных несколько таблиц с префиксом mamonsu. Не удаляйте эти таблицы, так как они нужны для работы mamonsu.




TODO экспорт-импорт шаблона через вызов команды с параметрами или скрипта init-start.sh (сейчас только вручную)
```
 "data": "Invalid parameter \"/rules/applications\": unexpected parameter \"updateExisting\"."
```

Загрузка шаблона мониторинга



Создание группы и хоста

docker run -it --entrypoint "mamonsu" mamonsu zabbix hostgroup create pg --url=http://192.168.99.100:8081/ --user=Admin --password=zabbix



docker run -it --entrypoint "mamonsu" mamonsu zabbix host create pg-master 15 10254 192.168.99.100 --url=http://192.168.99.100:8081/ --user=Admin --password=zabbix

где
    15 - id группы хостов созданной на предыдущем шаге
    10254 - id загруженного шаблона


TODO - получение или задание id принудительно



