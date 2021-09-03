ci: composer cleanup

cleanup:
	docker-compose down -v

composer:
	docker-compose run --rm composer validate
	docker-compose run --rm composer install --quiet --no-cache --ignore-platform-reqs

normalize:
	docker-compose run --rm composer normalize --quiet
