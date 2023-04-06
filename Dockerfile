FROM python:3.11.3-slim-bullseye
ARG VERSION
LABEL maintainer="38313840+movative@users.noreply.github.com"
RUN useradd -ms /bin/bash pio
USER pio
ENV PATH="$PATH:/home/pio/.local/bin"
RUN python -m pip install --no-cache --upgrade pip && \
    pip install --no-cache -U platformio==${VERSION} && \
    pio upgrade && \
    pio remote agent --help
ENTRYPOINT ["pio"]
CMD ["--help"]
