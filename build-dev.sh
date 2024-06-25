#!/bin/bash

# Копируем файл окружения для dev
cp docker/.env.dev .env

# Получение версии из semantic-release
VERSION=$(php -r 'echo json_decode(file_get_contents("composer.json"), true)["version"];')

# Сборка образа для dev с версией
docker build --build-arg ENV=dev --build-arg DEBUG=true -t 4erk/swoole-docker:dev-$VERSION .

# Тегирование последней версии как dev
docker tag 4erk/swoole-docker:dev-$VERSION 4erk/swoole-docker:dev

# Удаление временного файла окружения
rm .env