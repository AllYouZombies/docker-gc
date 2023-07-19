#!/bin/sh

set -e
CRON_SCHEDULE=${CRON_SCHEDULE?Variable CRON_SCHEDULE not set}

crontab -l | { cat; echo "$CRON_SCHEDULE /home/docker-gc/docker-gc > /proc/1/fd/1 2>&1"; } | crontab - || exit 1

exec "$@"