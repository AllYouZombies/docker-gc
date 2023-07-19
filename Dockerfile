FROM alpine:3.18
MAINTAINER "allyouzombies.t.me" <


RUN apk add --update docker && \
    rm -rf /var/cache/apk/* && \
    rm -rf /tmp/*


WORKDIR /home/docker-gc


COPY scripts/docker-gc docker-entrypoint.sh ./


RUN chmod +x docker-gc && \
    chmod +x docker-entrypoint.sh


ENTRYPOINT ["/home/docker-gc/docker-entrypoint.sh"]


CMD ["crond", "-f"]
