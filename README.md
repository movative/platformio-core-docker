# platformio-core-docker
<img src="https://raw.githubusercontent.com/movative/platformio-core-docker/main/platformio.png" alt="PlatformIO Icon" align="left" height="80" width="80" vspace="6"/>

[![license](https://img.shields.io/badge/license-Apache_2.0-green.svg)](https://github.com/movative/platformio-core-docker/blob/main/LICENSE)

This Docker image containerizes the [PlatformIO Core (CLI)](https://docs.platformio.org/) software, which is a professional collaborative platform for embedded development. This repo contains an installed pio cli in the entrypoint.

For more information about pio read the following links:
- https://docs.platformio.org/en/latest/plus/pio-remote.html
- https://docs.platformio.org/en/latest/envvars.html

***Example usage in a docker-compose file***

The docker-compose file contains various examples.
To use the pio client just add an pio.env file next to the docker-compose file and type `docker-compose up pio-test` and test the connection to your pio account.

```yaml
version: '3.9'
services:
  pio-help:
    build: .
    container_name: pio-build
    image: movative/platformio-core
  pio-test:
    container_name: pio-test
    image: movative/platformio-core
    command: ["start", "remote", "agent"]
    env_file:
      pio.env
```

***Example pio.env file***

```shell
PLATFORMIO_AUTH_TOKEN=<YOUR-TOKEN>
```
