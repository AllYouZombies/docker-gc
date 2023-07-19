FROM debian:bullseye-slim as BASE
MAINTAINER "allyouzombies.t.me" <

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install docker.io cron -y && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /home/docker-gc

COPY scripts/docker-gc .
COPY docker-entrypoint.sh .

RUN chmod +x docker-gc && \
    chmod +x docker-entrypoint.sh

ENTRYPOINT ["/home/docker-gc/docker-entrypoint.sh"]

CMD ["cron", "-f"]
