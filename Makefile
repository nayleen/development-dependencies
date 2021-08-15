ci: composer cleanup

cleanup:
	docker-compose down -v

composer:
	docker-compose run --rm composer validate
	docker-compose run --rm composer install --quiet --no-cache
	docker-compose run --rm composer normalize --quiet --dry-run
