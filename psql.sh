#!/bin/bash

docker exec -it yadockerpostgresql1c_PostgreSQL_1 su postgres -c psql $1
