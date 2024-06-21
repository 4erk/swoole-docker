FROM phpswoole/swoole:5.1.3-php8.3

# Аргументы для сборки
ARG DEBUG=false
ARG ENV=prod
ARG PORT=9501
ARG HOST=0.0.0.0

# Установка переменных окружения
ENV DEBUG=$DEBUG
ENV ENV=$ENV
ENV PORT=$PORT
ENV HOST=$HOST
ENV AUTORELOAD_PROGRAMS="swoole"
ENV AUTORELOAD_ANY_FILES=0
ENV SWOOLE_TIMEZONE="UTC"
ENV DISABLE_DEFAULT_SERVER=1
ENV PHP_IDE_CONFIG="serverName=swoole"
ENV XDEBUG_SESSION="PHPSTORM"
ENV PHP_ENABLE_XDEBUG=0
ENV BOOT_MODE="SERVICE"

# Установка Xdebug в зависимости от режима отладки
RUN if [ "$DEBUG" = "true" ]; then \
    set -ex && \
    pecl channel-update pecl.php.net && \
    pecl install xdebug-stable; \
    fi

# Установка рабочего каталога
WORKDIR /var/www

# Копирование необходимых файлов
COPY docker/main /
COPY docker/$ENV/ /
COPY docker/.env.$ENV ./.env
COPY composer.json ./
COPY server.php ./

# Установка зависимостей Composer
ARG COMPOSER_ALLOW_SUPERUSER=1
RUN if [ "$ENV" = "prod" ]; then \
    composer install --no-dev --optimize-autoloader; \
    else \
    composer install; \
    fi

# Открытие порта
EXPOSE $PORT

# Команда для запуска
CMD ["php", "server.php"]