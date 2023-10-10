FROM steamcmd/steamcmd:ubuntu-22

RUN apt-get update && \
    apt-get install vim less -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy docker entrypoint
COPY ./docker-entrypoint.sh /docker-entrypoint.sh

# Permissions
RUN chmod +x /docker-entrypoint.sh

# Entrypoint
ENTRYPOINT ["/docker-entrypoint.sh"]