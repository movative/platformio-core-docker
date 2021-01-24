FROM alpine:latest
RUN groupadd -r upio && useradd -r -g upio upio
RUN echo "INFO: Installing python3 via apk." && apk add --no-cache python3 py3-pip
RUN echo "INFO: Installing platformio via pip." && pip install --no-cache -U platformio
RUN echo "INFO: Creating image-wide symlinks." \ 
    && ln -s ~/.platformio/penv/bin/platformio /usr/local/bin/platformio \
    && ln -s ~/.platformio/penv/bin/pio /usr/local/bin/pio \
    && ln -s ~/.platformio/penv/bin/piodebuggdb /usr/local/bin/piodebuggdb
ENTRYPOINT ["pio remote agent"]
