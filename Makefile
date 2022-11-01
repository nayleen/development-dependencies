ci: composer cleanup

cleanup:
	@docker-compose down -v 2>/dev/null

composer:
	@docker-compose run --rm php composer validate 2>/dev/null
	@docker-compose run --rm php composer install --quiet --no-cache 2>/dev/null

normalize:
	@docker-compose run --rm php composer normalize --quiet 2>/dev/null
