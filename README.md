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
A high-performance, lightweight Docker environment optimized for local development. Engineered to be resource-efficient (RAM/CPU friendly) and to eliminate I/O bottlenecks commonly found on macOS.

This project is inspired by [Laradock](https://github.com/laradock/laradock) which is aimed at creating an application development environment based on WordPress, Laravel, and other frameworks.

## Install Prerequisites
All requisites should be available for your distribution. The most important are:
1. [Git](https://git-scm.com/downloads)
2. [Docker](https://docs.docker.com/engine/installation)
3. [Docker Compose](https://docs.docker.com/compose/install)

## Overview
We moved away from "fat-container" architecture to a modular, lightweight approach:
| Name     | Image Base         | Role                   |
| -------- | ------------------ | ---------------------- |
| Nginx    | nginx:alpine       | Web Server             |
| MySQL    | mysql:8.4          | Database               |
| PHP-FPM  | php:alpine         | Backend Logic          |
| Node-CLI | node:alpine        | Frontend (Vite/NextJS) |
| Redis    | redis:alpine       | Caching                |
| Adminer  | adminer:standalone | DB Management          |

## Structure
Place your Project outside this folder.

```sh
Development/
 ├── www/        # All your projects (Laravel, NextJS, etc.)
 └── Docker/     # This repository (Configuration only)
```

## Environment
Copy the example file and adjust your settings:

```sh
cp .env.example .env
```

Note: Ensure `APP_CODE_PATH_HOST` in your `.env` points correctly to your `../www` directory.

## Build
Build image with `Dockerfile`.

1. Build and Start

    ```sh
    docker compose up -d --build
    ```

2. Accessing Containers

    To run commands inside the PHP environment:

    ```sh
    docker compose exec php-fpm sh
    ```

    To run commands inside the Node environment:

    ```sh
    docker compose exec node-cli sh
    ```

2. Start and Stop

    Start the service, run the command:

    ```sh
    docker compose start
    ```

    Stop the service, run the command:

    ```sh
    docker compose stop
    ```

    If you want to delete a container to make it lighter but still have data, just use the command:

    ```sh
    docker compose down
    ```

    Never run docker `compose down -v`. The `-v` (volume) flag will delete the contents of your mysql data folder.

3. Database Access

    Access Adminer via `http://localhost:8081`.

## Networking & Hosts
For proper API communication, add your local domains to `/etc/hosts`:

```
127.0.0.1 api.domain.test app.domain.test
```

## Tech Stack
- Git
- Docker
- Docker Compose
- Visual Studio Code