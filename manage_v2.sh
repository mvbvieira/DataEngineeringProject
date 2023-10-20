#!/bin/sh

argument=$1

if [ $argument = "up" ]; then
    echo "Creating infrastructure..."
    docker-compose -f docker-compose-airflow2.yml up -d mongo
    sleep 5
    docker exec -it mongo /usr/local/bin/init.sh
    sleep 5
    docker-compose -f docker-compose-airflow2.yml up -d --remove-orphans
elif [ $argument = "stop" ]; then
    echo "Stopping infrastructure..."
    docker-compose -f docker-compose-airflow2.yml stop
elif [ $argument = "down" ]; then
    echo "Deleting infrastructure..."
    docker-compose -f docker-compose-airflow2.yml down
elif [ $argument = "build" ]; then
    echo "Deleting infrastructure..."
    docker-compose build
else
  echo "Unknown argumnet! Options: up, stop, down"
fi