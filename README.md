# Swoole-based PHP Application with Docker

This repository contains a Swoole-based PHP application, which is set up with a Docker-based development environment. The application is designed to run on a Swoole HTTP server and can be easily deployed across different environments.

## Table of Contents

- [Project Structure](#project-structure)
- [Getting Started](#getting-started)
- [Configuration](#configuration)
- [Running the Application](#running-the-application)
- [Testing the Application](#testing-the-application)
- [Using the Docker Image](#using-the-docker-image)
- [License](#license)

## Project Structure

The project's directory structure is as follows:

```
.
├── composer.json
├── composer.lock
├── docker
│   ├── dev
│   │   └── usr
│   │       └── local
│   │           └── php
│   │               └── php.ini
│   ├── docker-compose.yml
│   ├── main
│   ├── prod
│   └── test
├── Dockerfile
├── phpunit.xml
├── README.md
└── server.php
```

## Getting Started

1. Install Docker and Docker Compose on your local machine.
2. Clone this repository to your local development environment.
3. Open a terminal and navigate to the project's root directory.
4. Run the following command to install the project's dependencies:

   ```bash
   composer install
   ```

## Configuration

The application's configuration is managed through environment variables. You can set these variables in the `.env` file or directly in your Docker Compose configuration.

The following environment variables are used by the application:

- `HOST`: The host address for the Swoole HTTP server (default: `0.0.0.0`).
- `PORT`: The port number for the Swoole HTTP server (default: `9501`).
- `ENV`: The environment for the application (default: `prod`).

## Running the Application

To run the application in a Docker container, follow these steps:

1. Open a terminal and navigate to the project's root directory.
2. Run the following command to build the Docker image:

   ```bash
   docker-compose build
   ```

3. Run the following command to start the Docker container:

   ```bash
   docker-compose up -d
   ```

The application will be accessible at `http://localhost:9501` (or the specified host and port).

## Testing the Application

To run the application's tests, follow these steps:

1. Open a terminal and navigate to the project's root directory.
2. Run the following command to execute the tests:

   ```bash
   composer test
   ```

## Using the Docker Image

To use the Docker image for this project in other environments, follow these steps:

1. Build the Docker image locally using the provided `Dockerfile`.
2. Tag the image with a suitable name and version. For example:

   ```bash
   docker build -t user/swoole-app:latest .
   ```

3. Push the image to a Docker registry (e.g., Docker Hub) or a private registry.
4. Use the image in your deployment configuration or in your CI/CD pipeline.

## License

This project is licensed under the proprietary license.

Please note that the provided code snippet is a part of the application and is used to demonstrate the setup and configuration of the project. The complete codebase may contain additional files and directories not mentioned in this README.

If you have any further questions or need assistance, please don't hesitate to ask.



AUTORELOAD_PROGRAMS: "swoole"
AUTORELOAD_ANY_FILES: 0
SWOOLE_TIMEZONE: "America/Los_Angeles"
DISABLE_DEFAULT_SERVER: 1
PHP_IDE_CONFIG: "serverName=swoole"
XDEBUG_SESSION: "PHPSTORM"
PHP_ENABLE_XDEBUG: 1
BOOT_MODE: SERVICE