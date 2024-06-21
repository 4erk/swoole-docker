#!/bin/bash

# Копируем файл окружения для test
cp docker/.env.test .env

# Получение версии из semantic-release
VERSION=$(npx semantic-release --dry-run | grep "The next release version is" | sed -E 's/^.*is ([0-9]+\.[0-9]+\.[0-9]+).*$/\1/')

# Сборка образа для test с версией
docker build --build-arg ENV=test --build-arg DEBUG=false -t 4erk/swoole-docker:test-$VERSION .

# Тегирование последней версии как test
docker tag 4erk/swoole-docker:test-$VERSION 4erk/swoole-docker:test

# Удаление временного файла окружения
rm .env
