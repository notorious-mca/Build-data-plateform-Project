.PHONY: build_dockerfile help up down browse_mongo_express_ui browse_airflow_ui init

.DEFAULT_GOAL = help
# The name of the Docker Compose file
COMPOSE_FILE = docker-compose.yaml
# The current directory
CURRENT_DIR = $(shell pwd)
# The image name for the Docker container
IMAGE_NAME = mage_demo
# The configuration directory
CONFIG_DIR = $(CURRENT_DIR)/config

AIRFLOW_PORT ?= 8080
MONGO_EXPRESS_PORT ?= 8081
# Host
HOST ?= localhost

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

init:
	touch $(CURRENT_DIR)/.env

build_dockerfile: ## Build the docker image from the Dockerfile
	docker build -t $(IMAGE_NAME) $(CONFIG_DIR)

# Run the containers in the background
up: ## Run the containers
	@docker-compose -f $(CONFIG_DIR)/$(COMPOSE_FILE) up airflow-init
	docker-compose -f $(CONFIG_DIR)/$(COMPOSE_FILE) up

# Stop the containers
down: ## Stop the containers
	docker-compose -f $(CONFIG_DIR)/$(COMPOSE_FILE) down

browse_airflow_ui: ## Open Airflow Web UI
	open http://$(HOST):$(AIRFLOW_PORT)

browse_mongo_express_ui: ## Open Mongo Express Web UI
	open http://$(HOST):$(MONGO_EXPRESS_PORT)
