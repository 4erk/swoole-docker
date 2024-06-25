#!/bin/bash

# Копируем файл окружения для prod
cp docker/.env.prod .env

# Получение версии из semantic-release
VERSION=$(php -r 'echo json_decode(file_get_contents("composer.json"), true)["version"];')
# Сборка образа для prod с версией
docker build --build-arg ENV=prod --build-arg DEBUG=false -t 4erk/swoole-docker:prod-$VERSION .

# Тегирование последней версии как prod
docker tag 4erk/swoole-docker:prod-$VERSION 4erk/swoole-docker:prod

# Тегирование последней версии как latest
docker tag 4erk/swoole-docker:prod-$VERSION 4erk/swoole-docker:latest

# Удаление временного файла окружения
rm .env
