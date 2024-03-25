# Dexen simple application with Golang

[![Go Report Card](https://goreportcard.com/badge/github.com/StartloJ/dexen_app)](https://goreportcard.com/report/github.com/StartloJ/dexen_app)
[![GitHub tag](https://img.shields.io/github.com/StartloJ/dexen_app.svg)](https://github.com/StartloJ/dexen_app/releases/latest)
[![GitHub](https://img.shields.io/github/license/StartloJ/dexen_app)](https://github.com/StartloJ/dexen_app/blob/main/LICENSE)

API app with Golang provide simple API to call.

## Installation

### Go

```shell
go get github.com/StartloJ/dexen_app
```

### Docker

```shell
export VERSION='0.1.0-dev'
export TAG=$(VERSION)
export GIT_COMMIT=$(git rev-parse --short HEAD)
export DATE=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

docker build -t dexen:0.1.0-dev --build-arg=COMMIT=$GIT_COMMIT --build-arg=VERSION=$VERSION --build-arg=DATE=$DATE .
docker run -d --name dexen -e APP_LISTEN=':3000' -p 3000:3000 dexen:0.1.0-dev
```

### Podman

```shell
export VERSION='0.1.0-dev'
export TAG=$(VERSION)
export GIT_COMMIT=$(git rev-parse --short HEAD)
export DATE=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

podman build -t dexen:0.1.0-dev --build-arg=COMMIT=$GIT_COMMIT --build-arg=VERSION=$VERSION --build-arg=DATE=$DATE .
podman run -d --name dexen -e APP_LISTEN=':3000' -p 3000:3000 dexen:0.1.0-dev
```

## API spec

For release 1

- v1
  - GET
    - **base-os**: It will be represent currently base OS running for container app.

        ```json
        {
            "runtime_arch":"amd64",
            "runtime_os":"linux",
            "status":"success"
        }
        ```

    - **version**: It will be represent currently application’s version.

        ```json
        {
            "app_builtDate":"2024-03-25T12:54:14Z",
            "app_commit":"5ac515d",
            "app_version":"0.1.0-dev",
            "status":"success"
        }
        ```

## How to call API

You can access via REST API format. See example below.

1. You need to get baseOS.  

    ```shell
    $ curl localhost:3000/v1/base-os
    {"runtime_arch":"amd64","runtime_os":"linux","status":"success"}
    ```

2. You need to get app version.

    ```shell
    $ curl localhost:3000/v1/version
    {"app_builtDate":"2024-03-25T12:54:14Z","app_commit":"5ac515d","app_version":"0.1.0-dev","status":"success"}
    ```
