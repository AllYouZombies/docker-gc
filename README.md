# Docker garbage collection

This is a simple script to clean up your Docker host. It will:

* Remove all stopped containers
* Remove all networks not used by at least one container
* Remove all unused images

> **Note:** `docker system prune` is not used because it will remove all unused data (i.e. volumes) by default.
> Everythin except volumes can be recovered, but persistent data can not.
> If you want to remove all unused data, please use `docker system prune -a` by yourself.

> **If you find this useful, please consider starring the project on [GitHub](https://github.com/Anttek-io/docker-gc).**

---

## Usage

### Docker

```bash
export CRON_SCHEDULE="0 0 * * *" # every day at midnight

docker run \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -e CRON_SCHEDULE=$CRON_SCHEDULE \
    --name docker-gc \
    -d \
    --restart=always \
    anttek/docker-gc
```

### Docker Compose

```bash
tee .env <<EOF
CRON_SCHEDULE="0 0 * * *" # every day at midnight
TZ=UTC # timezone
EOF

docker compose up -d
```

### Ansible

```bash
cp -R inventory_sample inventory
# edit files in inventory directory

ansible-playbook playbooks/docker-gc.yml -b
```

#### Remove

```bash
ansible-playbook -b -i inventory/inventory playbooks/docker-gc-rm.yml
```

---

## License

[MIT](LICENSE)

[//]: # (README.md ends here)
[//]: # "vi: set ft=markdown :"

---
