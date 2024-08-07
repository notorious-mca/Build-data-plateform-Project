.PHONY: help build up down tf-init tf-apply tf-destroy init
.DEFAULT_GOAL = help


help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

build: ## Build the Dockerfile
	docker build -t dagster .

up: ## Run the docker-compose file
	docker-compose -f docker-compose.yaml up -d

down: ## Stop the docker-compose file
	docker-compose -f docker-compose.yaml down

tf-init: ## Initialize the directory for Terraform commands
	terraform -chdir="./IaC/" init

tf-apply: ## Create the infrastructures with Terraform
	terraform -chdir="./IaC/" apply	-var-file=terraform.tfvars

tf-destroy: ## Destroy the infrastructures with Terraform
	terraform -chdir="./IaC/" destroy

init: ## Initialize the project
	@echo "Création du fichier terraform.tfvars"
	@touch ./IaC/terraform.tfvars
	@echo "OK"
	@echo "Ajout des variables dans le fichier terraform.tfvars"
	@echo "GCS_BUCKET_NAME = \"\"">> ./IaC/terraform.tfvars
	@echo "GCS_BUCKET_LOCATION = \"\"">> ./IaC/terraform.tfvars
	@echo "GOOGLE_CLOUD_PROJECT = \"\"">> ./IaC/terraform.tfvars
	@echo "OK"
