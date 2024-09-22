dev:
	@echo "Starting DEV Server"
	docker compose up -d --force-recreate

prod:
	@echo "Starting Production Server"
	docker compose up -d --force-recreate --remove-orphans traefik

stop:
	@echo "Stopping Service"
	docker compose down --remove-orphans
