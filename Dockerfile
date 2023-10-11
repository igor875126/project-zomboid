FROM steamcmd/steamcmd:ubuntu-22

# Install additional packages [optional]
RUN apt-get update && \
    apt-get install vim less wget tar gzip -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Download/Unpack rcon-cli (Server Administration CLI)
ENV RCON_URL https://github.com/gorcon/rcon-cli/releases/download/v0.10.3/rcon-0.10.3-amd64_linux.tar.gz
ENV RCON_ARCHIVE_NAME rcon-0.10.3-amd64_linux.tar.gz
ENV RCON_PATH /root/rcon-0.10.3-amd64_linux
RUN cd /root && \
    wget $RCON_URL && \
    tar xvf $RCON_ARCHIVE_NAME && \
    rm -r $RCON_ARCHIVE_NAME

# Copy rcon shell script
COPY ./rcon /usr/local/sbin/rcon

# Copy docker entrypoint
COPY ./docker-entrypoint.sh /docker-entrypoint.sh

# Permissions
RUN chmod +x /docker-entrypoint.sh /usr/local/sbin/rcon

# Entrypoint
ENTRYPOINT ["/docker-entrypoint.sh"]