.PHONY: help build up down
.DEFAULT_GOAL = help



help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-10s\033[0m %s\n", $$1, $$2}'

build: ## Build the Dockerfile
	docker build -t dagster .

up: ## Run the docker-compose file
	docker-compose -f docker-compose.yaml up -d

down: ## Stop the docker-compose file
	docker-compose -f docker-compose.yaml down
