<?php
// Путь к файлу composer.json
$composerFile = __DIR__ . '/composer.json';

// Загрузка содержимого composer.json
try {
    $composerData = json_decode(file_get_contents($composerFile), true, 512, JSON_THROW_ON_ERROR);
} catch (JsonException $e) {
    echo 'JSON exception: ', $e->getMessage(), PHP_EOL;
    exit(1);
}

// Извлечение версии
$version = $composerData['version'];

// Вывод версии
echo $version;
