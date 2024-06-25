<?php

require 'vendor/autoload.php';

use PHLAK\SemVer\Version;

$composerFile = 'composer.json';
try {
    $composerData = json_decode(file_get_contents($composerFile), true, 512, JSON_THROW_ON_ERROR);


    // Получение текущей версии из composer.json
    $currentVersion = $composerData['version'] ?? '0.0.0';

    try {
        $version = new Version($currentVersion);

        // Получение последнего коммита
        $lastCommit = trim(shell_exec('git log -1 --pretty=%B'));

        if (str_starts_with($lastCommit, 'BREAKING CHANGE:')) {
            $newVersion = $version->incrementMajor();
        }
        elseif (str_starts_with($lastCommit, 'feat:')) {
            $newVersion = $version->incrementMinor();
        }
        else {

            $newVersion = $version->incrementPatch();
        }

        $newVersion = (string)$newVersion;

        $composerData['version'] = $newVersion;
        file_put_contents(
            $composerFile,
            json_encode($composerData, JSON_THROW_ON_ERROR | JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES)
        );

        echo "Version updated to: " . $newVersion . PHP_EOL;
    } catch (Exception $e) {
        echo 'Invalid version: ', $e->getMessage(), PHP_EOL;
        exit(1);
    }
} catch (JsonException $e) {
    echo 'JSON exception: ', $e->getMessage(), PHP_EOL;
    exit(1);
}
