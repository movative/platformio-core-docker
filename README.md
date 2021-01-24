# pio-remote-agent-docker
[![license](https://img.shields.io/badge/license-MIT-green.svg)](https://gitlab.com/movative/hugo-extended/-/blob/master/LICENSE)
[![](https://images.microbadger.com/badges/image/movative/hugo-extended.svg)](https://microbadger.com/images/movative/hugo-extended "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/movative/hugo-extended.svg)](https://microbadger.com/images/movative/hugo-extended "Get your own version badge on microbadger.com")

https://github.com/platformio/ is a professional collaborative platform for embedded development.
To easily share devices there is an option to install a pio cli and use the remote agent feature.
This docker image contains a pio cli so that each interface of a remote device could be shared to different pio accounts.

For more information about pio remote read the following links:
- https://docs.platformio.org/en/latest/plus/pio-remote.html
- https://docs.platformio.org/en/latest/core/userguide/remote/cmd_agent.html#pio-remote-agent-start
- Share remote device via pio auth
  - https://docs.platformio.org/en/latest/core/userguide/account/cmd_token.html#cmd-account-token
  - https://docs.platformio.org/en/latest/envvars.html#envvar-PLATFORMIO_AUTH_TOKEN

***Example usage in a docker-compose file***
```yaml
version: '2'
services:
  pio-remote-agent-local:
    build: .
    image: movative/pio-remote-agent
    command: ["start --name hostname"]
    devices:
      - "/dev/ttyUSB0:/dev/ttyUSB0"
      
  pio-remote-agent-with-share:
    build: .
    image: movative/pio-remote-agent
    command: ["start --name hostname --share"]
    devices:
      - "/dev/ttyUSB0:/dev/ttyUSB0"
    environment:
      - PLATFORMIO_AUTH_TOKEN: <YOUR-TOKEN>
```
