# Docker CCU-Historian

Docker image for [CCU-Historian](https://ccu-historian.de/).

## Information

| Service       | Stats                                                                                     |
|---------------|-------------------------------------------------------------------------------------------|
| Docker        | [![Build](https://img.shields.io/docker/cloud/build/xjokay/ccu-historian.svg?style=flat-square)](https://hub.docker.com/r/xjokay/ccu-historian/builds) [![Pulls](https://img.shields.io/docker/pulls/xjokay/ccu-historian.svg?style=flat-square)](https://hub.docker.com/r/xjokay/ccu-historian) [![Stars](https://img.shields.io/docker/stars/xjokay/ccu-historian.svg?style=flat-square)](https://hub.docker.com/r/xjokay/ccu-historian) [![Automated](https://img.shields.io/docker/cloud/automated/xjokay/ccu-historian.svg?style=flat-square)](https://hub.docker.com/r/xjokay/ccu-historian/builds) |
| GitHub        | [![Last commit](https://img.shields.io/github/last-commit/x-jokay/docker-ccu-historian.svg?style=flat-square)](https://github.com/x-jokay/docker-ccu-historian/commits/master) [![Issues](https://img.shields.io/github/issues-raw/x-jokay/docker-ccu-historian.svg?style=flat-square)](https://github.com/x-jokay/docker-ccu-historian/issues) [![PR](https://img.shields.io/github/issues-pr-raw/x-jokay/docker-ccu-historian.svg?style=flat-square)](https://github.com/x-jokay/docker-ccu-historian/pulls) [![Size](https://img.shields.io/github/repo-size/x-jokay/docker-ccu-historian.svg?style=flat-square)](https://github.com/x-jokay/docker-ccu-historian/) [![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)](https://github.com/x-jokay/docker-ccu-historian/blob/master/LICENSE) |
| CCU-Historian | [![Release](https://img.shields.io/github/release/mdzio/ccu-historian.svg?style=flat-square)](https://github.com/mdzio/ccu-historian/releases/latest) |

## General

| Topic     | Description                                                                                   |
|-----------|-----------------------------------------------------------------------------------------------|
| Image     | See [Docker Hub](https://hub.docker.com/r/xjokay/ccu-historian).                              |
| Source    | See [GitHub](https://github.com/x-jokay/docker-ccu-historian).                                |

## Installation

```sh
docker pull xjokay/ccu-historian
```

### Supported tags

| Tag    | Description                                                                         | Size                                                                                                                                                                  |
|--------|-------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| latest | Latest master build                                                                 | [![Size](https://shields.beevelop.com/docker/image/image-size/xjokay/ccu-historian/latest.svg?style=flat-square)](https://hub.docker.com/r/xjokay/ccu-historian/tags) |
| 2.5.2  | Release [2.5.2](https://github.com/x-jokay/docker-ccu-historian/releases/tag/2.5.2) | [![Size](https://shields.beevelop.com/docker/image/image-size/xjokay/ccu-historian/2.5.2.svg?style=flat-square)](https://hub.docker.com/r/xjokay/ccu-historian/tags)  |
| 2.5.1  | Release [2.5.1](https://github.com/x-jokay/docker-ccu-historian/releases/tag/2.5.1) | [![Size](https://shields.beevelop.com/docker/image/image-size/xjokay/ccu-historian/2.5.1.svg?style=flat-square)](https://hub.docker.com/r/xjokay/ccu-historian/tags)  |
| 2.4.0  | Release [2.4.0](https://github.com/x-jokay/docker-ccu-historian/releases/tag/2.4.0) | [![Size](https://shields.beevelop.com/docker/image/image-size/xjokay/ccu-historian/2.4.0.svg?style=flat-square)](https://hub.docker.com/r/xjokay/ccu-historian/tags)  |
| 2.3.0  | Release [2.3.0](https://github.com/x-jokay/docker-ccu-historian/releases/tag/2.3.0) | [![Size](https://shields.beevelop.com/docker/image/image-size/xjokay/ccu-historian/2.3.0.svg?style=flat-square)](https://hub.docker.com/r/xjokay/ccu-historian/tags)  |
| 2.2.2  | Release [2.2.2](https://github.com/x-jokay/docker-ccu-historian/releases/tag/2.2.2) | [![Size](https://shields.beevelop.com/docker/image/image-size/xjokay/ccu-historian/2.2.2.svg?style=flat-square)](https://hub.docker.com/r/xjokay/ccu-historian/tags)  |
| 2.2.1  | Release [2.2.1](https://github.com/x-jokay/docker-ccu-historian/releases/tag/2.2.1) | [![Size](https://shields.beevelop.com/docker/image/image-size/xjokay/ccu-historian/2.2.1.svg?style=flat-square)](https://hub.docker.com/r/xjokay/ccu-historian/tags)  |

### Exposed Ports

| Port | Protocol | Description              |
|------|----------|--------------------------|
|   80 | TCP      | Web-GUI Port             |
| 2098 | TCP      | Xml RPC Port             |
| 2099 | TCP      | Bin RPC Port             |
| 8082 | TCP      | Database Web-GUI Port    |
| 9092 | TCP      | Database TCP Port        |
| 5435 | TCP      | Database PostgreSQL Port |

### Volumes

| Directory                 | Description                 |
|---------------------------|-----------------------------|
| /database                 | Location of the database    |
| /opt/ccu-historian/config | Location of the config file |

### Configuration

These environment variables must be set for the first start:

| ENV field               | Req. / Opt.  | Description                                              |
|-------------------------|--------------|----------------------------------------------------------|
| CONFIG_CCU_TYPE         | **Required** | Type of the CCU hardware, e.g. `CCU1`, `CCU2` or `CCU3`. |
| CONFIG_CCU_IP           | **Required** | IP of the CCU.                                           |
| CONFIG_HOST_IP          | **Required** | IP of the Docker host.                                   |
| CONFIG_HOST_XMLRPCPORT  | *Optional*   | XML port of the RPC-port, e.g. `2098`.                   |
| CONFIG_HOST_BINRPCPORT  | *Optional*   | Bin port of the RPC-port, e.g. `2099`.                   |
| CONFIG_CCU_PLUGIN1_TYPE | *Optional*   | Additional plugins, e.g. `CUXD` or `HMWLGW`.             |
| CONFIG_CCU_PLUGIN2_TYPE | *Optional*   | Additional plugins, e.g. `CUXD` or `HMWLGW`.             |
| CONFIG_CCU_USERNAME     | *Optional*   | Username for authentication.                             |
| CONFIG_CCU_PASSWORD     | *Optional*   | Password for authentication.                             |
| CONFIG_KEEP_MONTHS      | *Optional*   | Cleanup of values older than x months. Maintenance is performed before the CCU-Historian is actually started. One after the other the CCU-Historian is called with the options -clean, -recalc and -compact. |

Additional config settings should be made by changing the config file `ccu-historian.config`
within the docker container.

It is easier to export the config folder out of the docker container and edit the file there.

## Samples

### docker-compose

```yaml
version: '3.8'

services:
  app:
    image: xjokay/ccu-historian:latest
    volumes:
      - ./data/database:/database
      - ./data/config:/opt/ccu-historian/config
    ports:
      - 80:80
      - 2098:2098
      - 2099:2099
    environment:
      - TZ=Europe/Zurich
      - CONFIG_CCU_TYPE=CCU3
      - CONFIG_CCU_IP=192.168.1.10
      - CONFIG_HOST_IP=192.168.1.100
      - CONFIG_HOST_BINRPCPORT=2099
      - CONFIG_HOST_XMLRPCPORT=2098
      - CONFIG_CCU_PLUGIN1_TYPE=CUXD
      - CONFIG_KEEP_MONTHS=12
    networks:
      - default
```

### docker run

```sh
docker run -d \
  -v $PWD/data/database:/database \
  -v $PWD/data/config:/opt/ccu-historian/config \
  -p 80:80 \
  -p 2098:2098 \
  -p 2099:2099 \
  -e TZ=Europe/Zurich \
  -e CONFIG_CCU_TYPE=CCU3 \
  -e CONFIG_CCU_IP=192.168.1.10  \
  -e CONFIG_HOST_IP=192.168.1.100 \
  -e CONFIG_HOST_BINRPCPORT=2099 \
  -e CONFIG_HOST_XMLRPCPORT=2098 \
  -e CONFIG_CCU_PLUGIN1_TYPE=CUXD \
  -e CONFIG_KEEP_MONTHS=12 \
  xjokay/ccu-historian:latest
```
