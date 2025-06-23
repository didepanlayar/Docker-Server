<div align="center">
    <img src="https://res.cloudinary.com/rexcuni/image/upload/v1688969225/favicon_oxddqi.png" width="80px">
    <br>
    <h1>Docker Server</h1>
</div>
<p align="center">
    <a href="https://didepanlayar.com" target="_blank"><img alt="" src="https://img.shields.io/badge/Website-1DA1F2?style=normal&logo=dribbble&logoColor=white" style="vertical-align: center" /></a>
    <a href="https://instagram.com/didepanlayar" target="_blank"><img alt="" src="https://img.shields.io/badge/Instagram-DD2A7B?style=normal&logo=instagram&logoColor=white" style="vertical-align: center" /></a>
    <a href="https://www.youtube.com/@didepanlayar" target="_blank"><img alt="" src="https://img.shields.io/badge/YouTube-CD201F?style=normal&logo=youtube&logoColor=white" style="vertical-align: center" /></a>
</p>

## Description
Docker Environment for Development or Production using Nginx, Multiple versions of PHP-FPM and modern website development with JavaScript.

This project is inspired by [Laradock](https://github.com/laradock/laradock) which is aimed at creating an application development environment based on WordPress, Laravel, and other frameworks.

## Install Prerequisites
All requisites should be available for your distribution. The most important are:
1. [Git](https://git-scm.com/downloads)
2. [Docker](https://docs.docker.com/engine/installation)
3. [Docker Compose](https://docs.docker.com/compose/install)

## Overview
All images are used:
| Name          | Tag      |
| ------------- | -------- |
| Nginx         | latest   |
| MySQL         | 8.4      |
| PHP-FPM       | 7.4, 8.2 |
| PHP-MyAdmin   | latest   |
| Redis         | latest   |
| Workspace     | 7.4, 8.2 |

Place your Project outside this folder.

```sh
.
├── Docker
├── Project A
├── Project B
├── Project C
└── Etc
```

Then you can add or change the nginx configuration in `nginx/sites/default.conf` and add your local domain to `/etc/hosts`.

## Environment
To run this project you need to add following environment variables to your `.env` file.

```
# Application
COMPOSE_PROJECT_NAME=docker

# MySQL
MYSQL_DATABASE=default
MYSQL_USER=default
MYSQL_PASSWORD=secret
MYSQL_PORT=3306
MYSQL_ROOT_PASSWORD=root
```

## Build
Build image with `Dockerfile`.

1. Copy and modify the `.env` file.

    ```sh
    cp .env.example .env
    ```

    Modify the `.env` file with the following [Environment](#environment) above.

2. Build image.

    ```sh
    docker-compose build --no-cache --force-rm
    ```

3. Start services.

    ```sh
    docker-compose up -d
    ```

4. Create or clone your Project.

    Accessing the containers.

    ```sh
    docker-compose exec workspace sh
    ```

5. Stop and clear services.

    ```sh
    docker-compose down -v
    ```

## Tech Stack
- Git
- Docker
- Docker Compose
- Visual Studio Code