.PHONY: ci vendor
ci: vendor cleanup

cleanup:
	docker-compose down -v

vendor: composer.json
	docker-compose run --rm composer validate
	docker-compose run --rm composer install --quiet --no-cache --ignore-platform-reqs
