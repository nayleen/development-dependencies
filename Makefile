.PHONY: ci vendor
ci: vendor cleanup

cleanup:
	docker-compose down -v

vendor: composer.json
	docker-compose run --rm composer validate
	docker-compose run --rm composer install --quiet --no-cache
	docker-compose run --rm composer normalize --quiet --dry-run
