include .env

$(VOLUMES_DIR)/certs/local.crt:
	mkdir -p $(VOLUMES_DIR)/certs
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		-keyout $(VOLUMES_DIR)/certs/local.key -out $(VOLUMES_DIR)/certs/local.crt -subj "/CN=*.docker.localhost"

dev: $(VOLUMES_DIR)/certs/local.crt
	@echo "Starting DEV Server"
	export TARGET=dev && docker compose up -d --force-recreate

prod:
	@echo "Starting Production Server"
	export TARGET=prod && docker compose up -d --force-recreate --remove-orphans traefik

stop:
	@echo "Stopping Service"
	docker compose down --remove-orphans
