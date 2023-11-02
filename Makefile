init:
	@if [ ! -d "src" ]; then \
		mkdir src; \
		make build; \
		make start; \
		make create-new-project; \
		make key-gen; \
		make migrate; \
	else \
		echo "src directory already exists. Initialization is skipped."; \
	fi
build:
	docker compose build
start:
	docker compose up -d
stop:
	docker compose down
destroy:
	docker compose down --rmi all --volumes --remove-orphans
create-new-project:
	@if [ -d "src" ] && [ -z "$(ls -A src)" ]; then \
		docker compose exec app sh -c "composer create-project laravel/laravel ."; \
	else \
		echo "src directory is not empty or does not exist. Project creation is skipped."; \
	fi
npm-install:
	docker compose exec app sh -c "npm install"
composer-install:
	docker compose exec app sh -c "composer install"
key-gen:
	docker compose exec app sh -c "php artisan key:generate"
migrate:
	docker compose exec app sh -c "php artisan migrate"
clear-cache:
	docker compose exec app sh -c "php artisan cache:clear"