.env:
	$(error file .env is missing, see .env.sample)

.traefik-prod:
	$(error file ./conf/traefik-static.prod.yml is missing, see ./conf/traefik-static.prod.yml.sample)

dev: .env
	@echo "Starting DEV Server"
	docker-compose -f docker-compose.base.yml -f docker-compose.dev.yml up -d --force-recreate
prod: .env .traefik-prod
	@echo "Starting Production Server"
	docker-compose -f docker-compose.base.yml -f docker-compose.prod.yml up -d --force-recreate --remove-orphans
stop:
	@echo "Stopping Service"
	docker-compose -f docker-compose.base.yml down --remove-orphans
