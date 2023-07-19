FROM alpine:3.18

# Add docker client to image
RUN apk add --update docker && \
    rm -rf /var/cache/apk/* && \
    rm -rf /tmp/*

# Set working directory
WORKDIR /home/docker-gc

# Copy scripts
COPY scripts/docker-gc docker-entrypoint.sh ./

# Add execution permissions to scripts
RUN chmod +x docker-gc && \
    chmod +x docker-entrypoint.sh

# Set entrypoint
ENTRYPOINT ["/home/docker-gc/docker-entrypoint.sh"]

# Set command that runs cron daemon in foreground
CMD ["crond", "-f"]
