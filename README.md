# platformio-core-docker
[![license](https://img.shields.io/badge/license-MIT-green.svg)](https://gitlab.com/movative/hugo-extended/-/blob/master/LICENSE)
[![](https://images.microbadger.com/badges/image/movative/hugo-extended.svg)](https://microbadger.com/images/movative/hugo-extended "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/movative/hugo-extended.svg)](https://microbadger.com/images/movative/hugo-extended "Get your own version badge on microbadger.com")

This Docker image containerizes the [PlatformIO Core (CLI)](https://docs.platformio.org/) software, which is a professional collaborative platform for embedded development. This image runs the pio client in the entrypoint. Just pass some Arguments to a docker container, as described below, to easily develop remotely and share devices using the remote agent feature from the pio client.

For more information about pio read the following links:
- https://docs.platformio.org/en/latest/plus/pio-remote.html
- https://docs.platformio.org/en/latest/envvars.html

***Example usage in a docker-compose file***

Just add an pio.env file next to the docker-compose file and type `docker-compose up pio-test` to the connection to your pio account.

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

