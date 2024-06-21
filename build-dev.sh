#!/bin/bash

# Копируем файл окружения для dev
cp docker/.env.dev .env

# Сборка образа для dev
docker build --build-arg ENV=dev --build-arg DEBUG=true -t 4erk/swoole-docker:dev .

# Удаление временного файла окружения
rm .env
