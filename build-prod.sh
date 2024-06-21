#!/bin/bash

# Копируем файл окружения для prod
cp docker/.env.prod .env

# Сборка образа для prod
docker build --build-arg ENV=prod --build-arg DEBUG=false -t 4erk/swoole-docker:prod .

# Удаление временного файла окружения
rm .env
