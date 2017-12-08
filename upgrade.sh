#!/bin/bash

echo "UPGRADE sandbox to latest version"

echo "ATTENTION !!! this will remove containers and create new"
echo "please answers yes, if you stoped aplications what use PG for testing"
echo "use this script only in sandbox"

docker-compose build
docker-compose pull
docker-compose down

docker-compose up -d
