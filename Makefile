dev:
	@echo "Starting DEV Server"
	docker-compose -f docker-compose.base.yml -f docker-compose.dev.yml up -d --force-recreate
prod:
	@echo "Starting Production Server"
	docker-compose -f docker-compose.base.yml -f docker-compose.prod.yml up -d --force-recreate
stop:
	@echo "Stopping Service"
	docker-compose -f docker-compose.base.yml down --remove-orphans
