# Makefile for Laravel + React E-Commerce Project

# Variables
COMPOSE := docker-compose
COMPOSE_PROD := docker-compose -f docker-compose.prod.yml
APP := app
DB := db

# Help
.PHONY: help
help:
	@echo "Available commands:"
	@echo "  setup            - Setup the development environment"
	@echo "  dev              - Start development environment"
	@echo "  stop             - Stop development environment"
	@echo "  down             - Stop and remove containers"
	@echo "  logs             - View logs"
	@echo "  app              - Enter app container shell"
	@echo "  migrate          - Run database migrations"
	@echo "  seed             - Run database seeders"
	@echo "  test             - Run tests"
	@echo "  lint             - Run code linters"
	@echo "  build            - Build frontend assets"
	@echo "  prod-up          - Start production environment"
	@echo "  prod-down        - Stop production environment"
	@echo "  clean            - Remove all containers and volumes"

# Setup development environment
.PHONY: setup
setup:
	$(COMPOSE) up -d
	$(COMPOSE) exec $(APP) composer install
	$(COMPOSE) exec $(APP) cp .env.example .env
	$(COMPOSE) exec $(APP) php artisan key:generate
	$(COMPOSE) exec $(APP) php artisan migrate
	@echo "Development environment is ready!"

# Start development environment
.PHONY: dev
dev:
	$(COMPOSE) up -d
	@echo "Development environment started!"

# Stop development environment
.PHONY: stop
stop:
	$(COMPOSE) stop
	@echo "Development environment stopped!"

# Stop and remove containers
.PHONY: down
down:
	$(COMPOSE) down
	@echo "Containers removed!"

# View logs
.PHONY: logs
logs:
	$(COMPOSE) logs -f

# Enter app container shell
.PHONY: app
app:
	$(COMPOSE) exec $(APP) bash

# Run database migrations
.PHONY: migrate
migrate:
	$(COMPOSE) exec $(APP) php artisan migrate

# Run database seeders
.PHONY: seed
seed:
	$(COMPOSE) exec $(APP) php artisan db:seed

# Run tests
.PHONY: test
test:
	$(COMPOSE) exec $(APP) ./vendor/bin/pest

# Run code linters
.PHONY: lint
lint:
	$(COMPOSE) exec $(APP) ./vendor/bin/pint --test
	$(COMPOSE) exec $(APP) npm run lint
	$(COMPOSE) exec $(APP) npm run format:check

# Build frontend assets
.PHONY: build
build:
	$(COMPOSE) exec $(APP) npm run build

# Start production environment
.PHONY: prod-up
prod-up:
	$(COMPOSE_PROD) up -d
	@echo "Production environment started!"

# Stop production environment
.PHONY: prod-down
prod-down:
	$(COMPOSE_PROD) down
	@echo "Production environment stopped!"

# Remove all containers and volumes
.PHONY: clean
clean:
	$(COMPOSE) down -v
	$(COMPOSE_PROD) down -v
	@echo "All containers and volumes removed!"