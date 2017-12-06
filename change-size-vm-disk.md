# Изменение размера диска виртуальной машины

##  docker for windows (hyperv)
TODO 



## docker toolbox (virtualbox)
Необходимо закрыть kitematic если запущен.

В консоли Docker Quickstart Terminal выполним команду удаления машины
```
$ docker-machine rm default
```

И пересоздадим её с размером диска 100 Гб.
```
$ docker-machine create -d virtualbox --virtualbox-disk-size "102400" default
```