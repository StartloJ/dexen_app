# Dexen simple application with Golang

[![Go Report Card](https://goreportcard.com/badge/github.com/StartloJ/dexen_app)](https://goreportcard.com/report/github.com/StartloJ/dexen_app)
[![GitHub tag](https://img.shields.io/github.com/StartloJ/dexen_app.svg)](https://github.com/StartloJ/dexen_app/releases/latest)
[![GitHub](https://img.shields.io/github/license/StartloJ/dexen_app)](https://github.com/StartloJ/dexen_app/blob/main/LICENSE)

API app with Golang provide simple API to call.

## Installation

### Go

> go get github.com/StartloJ/graylog-alert-exporter

### Docker

```shell
docker build -t dexen:0.1.0-dev .
docker run -d --name dexen -e APP_LISTEN=':3000' -p 3000:3000 dexen:0.1.0-dev
```
