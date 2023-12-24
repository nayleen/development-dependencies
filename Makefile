DEPENDENCY_VERSIONS ?= stable

ci: composer cleanup

cleanup:
	@docker-compose down -v 2>/dev/null
	@rm -rf vendor/

composer:
	@docker-compose run --rm php composer validate 2>/dev/null
	@docker-compose run --rm php composer update --no-cache --prefer-$(DEPENDENCY_VERSIONS) --prefer-stable 2>/dev/null

normalize:
	@docker-compose run --rm php composer normalize --quiet 2>/dev/null
