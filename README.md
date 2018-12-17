# Docker container for CCU-Historian

Minimal Docker container for [CCU-Historian](https://ccu-historian.de/) on [Alpine Linux](https://alpinelinux.org).

## General

### License

See [LICENSE.md](LICENSE.md).

### Source

See [GitHub](https://github.com/x-jokay/docker-ccu-historian).

### Container

See [Docker Hub](https://hub.docker.com/r/xjokay/ccu-historian).

## Installation

```sh
docker pull xjokay/ccu-historian
```

### Supported tags

| Tag    | Description                     |
|--------|---------------------------------|
| latest | Latest stable (currently [1.2.0](https://github.com/mdzio/ccu-historian/releases/tag/1.2.0)) |
| beta   | Beta (currently [2.0.0-beta.5](https://github.com/mdzio/ccu-historian/releases/tag/2.0.0-beta.5))   |

### Exposed Ports

| Port | Protocol | Description |
|------|----------|-------------|
|   80 | TCP      | Web-GUI     |
| 2098 | TCP      | XmlRpcPort  |
| 2099 | TCP      | BinRpcPort  |

### Shared Volumes

| Directory                 | Description                 |
|---------------------------|-----------------------------|
| /database                 | Location of the database    |
| /opt/ccu-historian/config | Location of the config file |

### Configuration

These Enviorment varibables must be set for the first start:

| ENV field               | Values           | Description                          |
|-------------------------|------------------|--------------------------------------|
| CONFIG_CCU_TYPE         | CCU1, CCU2, CCU3 | Type of the CCU hardware             |
| CONFIG_CCU_IP           |                  | IP of the CCU                        |
| CONFIG_HOST_IP          |                  | IP of the Docker host                |
| CONFIG_HOST_XMLRPCPORT  | 2098             | _Optional:_ XML port of the RPC-port |
| CONFIG_HOST_BINRPCPORT  | 2099             | _Optional:_ Bin port of the RPC-port |
| CONFIG_CCU_PLUGIN1_TYPE | CUXD, HMWLGW     | _Optional:_ Additional plugins       |
| CONFIG_CCU_PLUGIN2_TYPE | CUXD, HMWLGW     | _Optional:_ Additional plugins       |

Additional config settings should be made by changing the config file ccu-historian.config
within the docker container.

It is easier to export the config folder out of the docker container and edit the file there.

### Sample docker-compose

```sh
version: '3.6'

services:
  ccu-historian:
    image: xjokay/ccu-historian:latest
    container_name: ccu-historian
    volumes:
      - ./database:/database
      - ./config:/opt/ccu-historian/config
    ports:
      - '80:80'
      - '2098:2098'
      - '2099:2099'
    restart: on-failure
    environment:
      - TZ=Europe/Zurich
      - CONFIG_CCU_TYPE=CCU2
      - CONFIG_CCU_IP=192.168.1.10
      - CONFIG_HOST_IP=192.168.1.100
    networks:
      - default
```