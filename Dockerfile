FROM python:latest
LABEL maintainer="38313840+movative@users.noreply.github.com"
RUN echo "INFO: Installing platformio via pip." && pip install --no-cache -U platformio
RUN useradd -ms /bin/bash pio
USER pio
RUN echo "INFO: Adding pio to the path variable and checking the version." && \
    echo "export PATH=$PATH:~/.platformio/penv/bin" >> ~/.bash_profile && \
    pio upgrade && pio remote agent --help
ENTRYPOINT ["pio"]
CMD ["--help"]
