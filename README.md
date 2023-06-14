# Docker CCU-Historian

Multi-platform Docker image for [CCU-Historian](https://github.com/mdzio/ccu-historian).

## Information

| Service                                                     | Stats                                                                                                                                                                                                                                                                                                               |
|-------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [GitHub](https://github.com/jokay/docker-ccu-historian)     | ![Last commit](https://img.shields.io/github/last-commit/jokay/docker-ccu-historian.svg?style=flat-square) ![Issues](https://img.shields.io/github/issues-raw/jokay/docker-ccu-historian.svg?style=flat-square) ![PR](https://img.shields.io/github/issues-pr-raw/jokay/docker-ccu-historian.svg?style=flat-square) |
| [Docker Hub](https://hub.docker.com/r/xjokay/ccu-historian) | ![Pulls](https://img.shields.io/docker/pulls/xjokay/ccu-historian.svg?style=flat-square) ![Stars](https://img.shields.io/docker/stars/xjokay/ccu-historian.svg?style=flat-square)                                                                                                                                   |

## Usage

```sh
docker pull docker.io/xjokay/ccu-historian:latest
```

### Supported tags

| Tag       | Description                                                                                                |
|-----------|------------------------------------------------------------------------------------------------------------|
| latest    | [Latest](https://github.com/jokay/docker-ccu-historian/releases/latest) release                            |
| {release} | Specific release version, see available [releases](https://github.com/jokay/docker-ccu-historian/releases) |

### Exposed Ports

| Port | Protocol | Description              |
|------|----------|--------------------------|
| 80   | TCP      | Web-GUI Port             |
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

| ENV field               | Req. / Opt.  | Description                                                                                                                                                                                                              |
|-------------------------|--------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| CONFIG_CCU_TYPE         | **Required** | Type of the CCU hardware, e.g. `CCU1`, `CCU2` or `CCU3`.                                                                                                                                                                 |
| CONFIG_CCU_IP           | **Required** | IP of the CCU.                                                                                                                                                                                                           |
| CONFIG_HOST_IP          | **Required** | IP of the Docker host.                                                                                                                                                                                                   |
| CONFIG_HOST_XMLRPCPORT  | *Optional*   | XML port of the RPC-port, e.g. `2098`.                                                                                                                                                                                   |
| CONFIG_HOST_BINRPCPORT  | *Optional*   | Bin port of the RPC-port, e.g. `2099`.                                                                                                                                                                                   |
| CONFIG_CCU_PLUGIN1_TYPE | *Optional*   | Additional plugins, e.g. `CUXD` or `HMWLGW`.                                                                                                                                                                             |
| CONFIG_CCU_PLUGIN2_TYPE | *Optional*   | Additional plugins, e.g. `CUXD` or `HMWLGW`.                                                                                                                                                                             |
| CONFIG_CCU_USERNAME     | *Optional*   | Username for authentication.                                                                                                                                                                                             |
| CONFIG_CCU_PASSWORD     | *Optional*   | Password for authentication.                                                                                                                                                                                             |
| CONFIG_KEEP_MONTHS      | *Optional*   | Cleanup of values older than x months. Maintenance is performed before the CCU-Historian is actually started. One after the other the CCU-Historian is called with the options **-clean**, **-recalc** and **-compact**. |
| CONFIG_MAINTENANCE      | *Optional*   | Supported values are `true` and `false`. Maintenance is performed before the CCU-Historian is actually started. One after the other the CCU-Historian is called with the options **-recalc** and **-compact**.           |
| CONFIG_JAVA_OPTS        | *Optional*   | Allows to set Java custom settings, e.g. `"-Xmx100m"` to set the max heap size to 100 megabytes.                                                                                                                         |

Additional config settings should be made by changing the config file `ccu-historian.config`
within the docker container.

It is easier to export the config folder out of the docker container and edit
the file there.

## Samples

### docker-compose

```yml
services:
  app:
    image: docker.io/xjokay/ccu-historian:latest
    volumes:
      - ./data/database:/database
      - ./data/config:/opt/ccu-historian/config
    ports:
      - 80:80
      - 2098:2098
      - 2099:2099
      - 8082:8082
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
  -p 8082:8082 \
  -e TZ=Europe/Zurich \
  -e CONFIG_CCU_TYPE=CCU3 \
  -e CONFIG_CCU_IP=192.168.1.10  \
  -e CONFIG_HOST_IP=192.168.1.100 \
  -e CONFIG_HOST_BINRPCPORT=2099 \
  -e CONFIG_HOST_XMLRPCPORT=2098 \
  -e CONFIG_CCU_PLUGIN1_TYPE=CUXD \
  -e CONFIG_KEEP_MONTHS=12 \
  docker.io/xjokay/ccu-historian:latest
```
