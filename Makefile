include .env

$(VOLUMES_DIR)/certs/local.crt:
	mkdir -p $(VOLUMES_DIR)/certs
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		-keyout $(VOLUMES_DIR)/certs/local.key -out $(VOLUMES_DIR)/certs/local.crt \
		-subj "/CN=*.localhost" \
		-addext "subjectAltName=DNS:*.localhost,DNS:localhost,DNS:*.docker.localhost"

.PHONY: create-traefik-yml
create-traefik-yml:
	@echo "Creating traefik.yml from traefik.common.yml and traefik.$(TARGET).yml"
	set -a; . ./.env; set +a; \
	cat conf/traefik.common.yml conf/traefik.$(TARGET).yml | envsubst > conf/traefik.yml

.PHONY: dev
dev: $(VOLUMES_DIR)/certs/local.crt create-traefik-yml
	@echo "Starting DEV Server"
	docker compose up -d --force-recreate

.PHONY: prod
prod: create-traefik-yml
	@echo "Starting Production Server"
	docker compose up -d --force-recreate --remove-orphans traefik

.PHONY: stop
stop:
	@echo "Stopping Service"
	docker compose down --remove-orphans

.PHONY: logs
logs:
	docker compose logs -f --tail=100
