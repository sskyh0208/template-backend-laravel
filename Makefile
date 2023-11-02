init:
	@make build
	@make start
	@make create-new-project
	@make key-gen
	@make migrate
build:
	docker compose build
start:
	docker compose up -d
stop:
	docker compose down
destroy:
	docker compose down --rmi all --volumes --remove-orphans
create-new-project:
	docker compose exec app sh -c "rm -rf .gitkeep && composer create-project laravel/laravel ."
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