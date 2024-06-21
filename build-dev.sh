#!/bin/bash

# Копируем файл окружения для dev
cp docker/.env.dev .env

# Получение версии из semantic-release
VERSION=$(npx semantic-release --dry-run | grep "The next release version is" | sed -E 's/^.*is ([0-9]+\.[0-9]+\.[0-9]+).*$/\1/')

# Сборка образа для dev с версией
docker build --build-arg ENV=dev --build-arg DEBUG=true -t 4erk/swoole-docker:dev-$VERSION .

# Тегирование последней версии как dev
docker tag 4erk/swoole-docker:dev-$VERSION 4erk/swoole-docker:dev

# Удаление временного файла окружения
rm .env