#!/bin/bash

# Копируем файл окружения для test
cp docker/.env.test .env

# Сборка образа для test
docker build --build-arg ENV=test --build-arg DEBUG=false -t 4erk/swoole-docker:test .

# Удаление временного файла окружения
rm .env
