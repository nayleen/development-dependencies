SHELL=/bin/bash

UID := $(shell id -u)
GID := $(shell id -g)

export UID
export GID

ci: composer cleanup

cleanup:
	@docker-compose down -v 2>/dev/null

composer:
	@docker-compose run --rm composer validate 2>/dev/null
	@docker-compose run --rm composer install --quiet --no-cache --ignore-platform-reqs 2>/dev/null

normalize:
	@docker-compose run --rm composer normalize --quiet 2>/dev/null
